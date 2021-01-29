Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A330878A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:47:26 +0100 (CET)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QNB-0000kq-SP
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5QLA-0008B5-Qv
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:45:20 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5QL6-00087O-Nh
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:45:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 7565C86F857E;
 Fri, 29 Jan 2021 10:45:13 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 10:45:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00483c427a3-9e09-47e2-b754-31bda962a7d1,
 F0B20D4B8DDBF51DA61C26A45925665B938B7F3E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 29 Jan 2021 10:45:07 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 3/6] vhost-user: Return error code from slave_read()
Message-ID: <20210129104507.1ade37a7@bahia.lan>
In-Reply-To: <20210125180115.22936-4-vgoyal@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-4-vgoyal@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ab180389-152b-47e4-931f-8452344bd43d
X-Ovh-Tracer-Id: 15648038382011324777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021 13:01:12 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> Right now slave_read() is called through main event loop and does not
> return error. In next few patches I want to call slave_read() from
> vhost device shutdown path as well and want to know if an error
> happened so that caller can give up and return error accordingly.
> 
> Hence, create helper function do_slave_read(), which returns an
> integer. Success is 0 and negative number is error code. slave_read()
> calls do_slave_read() and ignores error code.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 43 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d95dbc39e3..867cac034f 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1401,7 +1401,7 @@ static uint64_t vhost_user_slave_handle_vring_host_notifier(
>      return false;
>  }
>  
> -static void slave_read(void *opaque)
> +static int do_slave_read(void *opaque)
>  {
>      struct vhost_dev *dev = opaque;
>      struct vhost_user *u = dev->opaque;
> @@ -1432,13 +1432,22 @@ static void slave_read(void *opaque)
>          size = recvmsg(u->slave_fd, &msgh, 0);
>      } while (size < 0 && (errno == EINTR || errno == EAGAIN));
>  
> -    if (size != VHOST_USER_HDR_SIZE) {
> +    if (size < 0) {
> +        ret = -errno;
>          error_report("Failed to read from slave.");
>          goto err;
>      }
>  
> +    if (size != VHOST_USER_HDR_SIZE) {
> +        error_report("Failed to read %lu bytes from slave.",
> +                     VHOST_USER_HDR_SIZE);

Maybe also print size ?

And, question from a newbie : any idea why short reads are
considered as errors instead of retrying ? Same question
stands for the other locations where we check the numbers
of read/written bytes in this function.

> +        ret = -EBADMSG;
> +        goto err;
> +    }
> +
>      if (msgh.msg_flags & MSG_CTRUNC) {
>          error_report("Truncated message.");
> +        ret = -EBADMSG;
>          goto err;
>      }
>  
> @@ -1456,6 +1465,7 @@ static void slave_read(void *opaque)
>          error_report("Failed to read msg header."
>                  " Size %d exceeds the maximum %zu.", hdr.size,
>                  VHOST_USER_PAYLOAD_SIZE);
> +        ret = -EBADMSG;
>          goto err;
>      }
>  
> @@ -1464,8 +1474,15 @@ static void slave_read(void *opaque)
>          size = read(u->slave_fd, &payload, hdr.size);
>      } while (size < 0 && (errno == EINTR || errno == EAGAIN));
>  
> -    if (size != hdr.size) {
> +    if (size == -1) {

Maybe make it (size < 0) for consistency with the error checking
added above ? And this seems to be the preferred way in the QEMU
tree :)

>          error_report("Failed to read payload from slave.");
> +        ret = errno;

    ret = -errno;

And this should be done before error_report() to ensure errno
isn't cloberred.

> +        goto err;
> +    }
> +
> +    if (size != hdr.size) {
> +        error_report("Failed to read %d payload bytes from slave.", hdr.size);
> +        ret = -EBADMSG;
>          goto err;
>      }
>  
> @@ -1529,13 +1546,22 @@ static void slave_read(void *opaque)
>              size = writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
>          } while (size < 0 && (errno == EINTR || errno == EAGAIN));
>  
> -        if (size != VHOST_USER_HDR_SIZE + hdr.size) {
> +        if (size == -1) {

size < 0

>              error_report("Failed to send msg reply to slave.");
> +            ret = -errno;

Move before error_report()

> +            goto err;
> +        }
> +
> +        if (size != VHOST_USER_HDR_SIZE + hdr.size) {
> +            error_report("Failed to send msg reply to slave. Wrote %d bytes"
> +                         " expected %lu bytes.", size,
> +                         VHOST_USER_HDR_SIZE + hdr.size);
> +            ret = -EIO;
>              goto err;
>          }
>      }
>  
> -    return;
> +    return 0;
>  
>  err:
>      qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
> @@ -1546,7 +1572,12 @@ err:
>              close(fd[i]);
>          }
>      }
> -    return;
> +    return ret;
> +}
> +
> +static void slave_read(void *opaque)
> +{
> +    do_slave_read(opaque);
>  }
>  
>  static int vhost_setup_slave_channel(struct vhost_dev *dev)



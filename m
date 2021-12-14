Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B134745CA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:02:43 +0100 (CET)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9KE-0001p3-9s
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mx9Bm-0005Lc-39
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mx9Bj-0000MC-LX
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639493634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bww3FjE+9mWIcaFpjk1B2/vSaRSsRla45o/TEhiU+c8=;
 b=OlKPB/h7zOgX1puEBXhadNxU5IuJc7jIjkHvwv1qmTZcEgiuknYU0vEiS4AfSffwCGMg6r
 UMyfN65bhzSHr7pUYFVlsGYcKD/RzeeAT8tVR26mUkvhG/y0EKoyOOQyKg94IiH+lnsqXt
 v995AmHbVqSXewS+KMv/qsblanK4HuE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-MaLH-QY3NretcFEAEIMEFA-1; Tue, 14 Dec 2021 09:53:53 -0500
X-MC-Unique: MaLH-QY3NretcFEAEIMEFA-1
Received: by mail-ed1-f71.google.com with SMTP id
 d13-20020a056402516d00b003e7e67a8f93so17295050ede.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 06:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bww3FjE+9mWIcaFpjk1B2/vSaRSsRla45o/TEhiU+c8=;
 b=YkqFlCn+FEh2JVnervUFuHNZCINoxBxBpMlFwsMTkhYbeydZbKm412ZSLSptH+uoQJ
 PFPdC2wvs7PYZd4hSNZ4yQmoOjUn19I+qepdcj4tzcP9499hRcangwM626cKhj/glT5Y
 pkJDPP6JCgi8vkW6/6vUlbf/dSq5boysWKWoMXXD2mRDjOWrHFnZovJeCY++Cu8tQ75J
 nVvqUrTnzUjDFIQuA2y9dbs4jXnUxV0KhSJg9X+7qVDGE1+G3srPRyBvibz5nJP7YFc2
 68hmKOJTLm2z8i9OmUDdgnucJTszymvO5ITzwJCTEYFezzNIsXibO5gSNN7FDDpFFZEN
 Pp9A==
X-Gm-Message-State: AOAM533CS0QujxzWUI3nUBlvruPsSYbvnXg3TcEiCEc4wv7/wjvcwQBh
 FMmbRzB9I2WohXvwR7dWfWnbabbZFM3e72+Wz4jUiTToIGeSl5KLpRHeQZ/nJYNkMxT5laszMDt
 MIdkbRvc6x08KTEw=
X-Received: by 2002:a05:6402:34d1:: with SMTP id
 w17mr8424383edc.229.1639493632290; 
 Tue, 14 Dec 2021 06:53:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlqY+9JBoP+ko+gMWCScayGSqfeqvBFrRPomYNM6/IVuJGvHmO6u6FkSgW2MetkrB09YxZ4w==
X-Received: by 2002:a05:6402:34d1:: with SMTP id
 w17mr8424355edc.229.1639493632093; 
 Tue, 14 Dec 2021 06:53:52 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:16f0:f0b:e3a1:9320:9a1c])
 by smtp.gmail.com with ESMTPSA id r11sm8135493edd.70.2021.12.14.06.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 06:53:51 -0800 (PST)
Date: Tue, 14 Dec 2021 09:53:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
Message-ID: <20211214094355-mutt-send-email-mst@kernel.org>
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Sosedkin <asosedkin@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-discuss@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 09:02:15AM +0100, Thomas Huth wrote:
>  Hi!
> 
> On 10/12/2021 18.02, Alexander Sosedkin wrote:
> > With QEMU 5 I could totally issue a QMP netdev_add
> > with the same ID to adjust the NetdevUserOptions I want,
> > such as restrict or hostfwd. No deleting needed,
> > just a netdev_add with what I want changed as a param.
> 
> I'm a little bit surprised that this worked, since AFAIK there is no code in
> QEMU to *change* the parameters of a running netdev... likely the code added
> a new netdev with the same ID, replacing the old one?
> 
> > With QEMU 6 it started failing, claiming the ID is already used.
> > And if I do netdev_del + netdev_add, I just lose connectivity.
> > What's even stranger, I still see old netdev attached in info network:
> > 
> > > netdev_del {'id': 'net0'}
> > {}
> > > human-monitor-command {'command-line': 'info network'}
> > virtio-net-pci.0:
> > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> >   \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> 
> I think that's "normal" - there used to be problems in the past that the
> devices (virtio-net-pci in this case) did not like the netdevs to be removed
> on the fly. So the netdevs are kept around until you remove the device, too
> (i.e. issue a device_del for the virtio-net-pci device).
> 
> > > netdev_add {'type': 'user', 'id': 'net0', 'restrict': False, 'hostfwd': [{'str': 'tcp:127.0.0.1:58239-:22'}]}
> > {}
> > > human-monitor-command {'command-line': 'info network'}
> > unseal: virtio-net-pci.0:
> > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> >   \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> > net0: index=0,type=user,net=10.0.2.0,restrict=off
> > 
> > What's the correct QMP command sequence to modify NetdevUserOptions?
> 
> AFAIK there is no way to modify running netdevs - you'd have to delete the
> netdev and the device, and then add both again. But I might have missed
> something here, so I CC:-ed some people who might be more familiar with the
> details here.
> 
>  Thomas
> 
> 
> > Please CC me on replies.


Wow this really goes to show how wide our feature matrix is.

Yes it's probably an unintended side effect but yes it
did work it seems, so we really should not just break it
without warning.


Probably this one:

commit 831734cce6494032e9233caff4d8442b3a1e7fef
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Nov 25 11:02:20 2020 +0100

    net: Fix handling of id in netdev_add and netdev_del



Jason, what is your take here?


Alexander, what happens if we just drop the duplicate ID check? Do
things work for you again?
Warning: completely untested.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


diff --git a/net/net.c b/net/net.c
index f0d14dbfc1..01f5a187b6 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1055,12 +1055,6 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
         }
     }
 
-    nc = qemu_find_netdev(netdev->id);
-    if (nc) {
-        error_setg(errp, "Duplicate ID '%s'", netdev->id);
-        return -1;
-    }
-
     if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
         /* FIXME drop when all init functions store an Error */
         if (errp && !*errp) {
-- 
MST



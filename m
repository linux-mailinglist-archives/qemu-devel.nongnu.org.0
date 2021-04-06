Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E1355786
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:16:17 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnRA-0005D2-BA
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lTnFG-00011k-7o
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lTnFB-0006ks-Qf
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617721426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2d8+MC57o4IsF1TTcqDmLys714+LdD29wBk98kUeoTQ=;
 b=GURs/0OSicEzHRuqWNlVOWQtIXOmkRS6L+0pJTryLarfLo5CP5zjGUgL7f73Q1lGb72+eS
 znbrIxnHO+g694yq3hUzzb74AWl1Rrh2zkuczDTkIc7MlR1T+V6MKwwTmM8s5+PAp/UT5K
 JNashVbmjiMqxGQjWhxLmgSIPmVYPtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-7efExgEMNxWhlBCa3gBFnA-1; Tue, 06 Apr 2021 11:03:42 -0400
X-MC-Unique: 7efExgEMNxWhlBCa3gBFnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F11C184BA1E;
 Tue,  6 Apr 2021 15:03:40 +0000 (UTC)
Received: from gondolin (ovpn-112-170.ams2.redhat.com [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71B90610F5;
 Tue,  6 Apr 2021 15:03:09 +0000 (UTC)
Date: Tue, 6 Apr 2021 17:03:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210406170306.1be374c2.cohuck@redhat.com>
In-Reply-To: <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  6 Apr 2021 09:44:13 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> ccw_dstream_read/write functions returned values are sometime
> not taking into account and reported back to the upper level
> of interpretation of CCW instructions.
> 
> It follows that accessing an invalid address does not trigger
> a subchannel status program check to the guest as it should.
> 
> Let's test the return values of ccw_dstream_write[_buf] and
> ccw_dstream_read[_buf] and report it to the caller.

Yes, checking/propagating the return code is something that was missing
in several places.

> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  hw/char/terminal3270.c | 11 +++++--
>  hw/s390x/3270-ccw.c    |  3 ++
>  hw/s390x/css.c         | 16 +++++-----
>  hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
>  4 files changed, 69 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
> index a9a46c8ed3..82e85fac2e 100644
> --- a/hw/char/terminal3270.c
> +++ b/hw/char/terminal3270.c
> @@ -200,9 +200,13 @@ static int read_payload_3270(EmulatedCcw3270Device *dev)
>  {
>      Terminal3270 *t = TERMINAL_3270(dev);
>      int len;
> +    int ret;
>  
>      len = MIN(ccw_dstream_avail(get_cds(t)), t->in_len);
> -    ccw_dstream_write_buf(get_cds(t), t->inv, len);
> +    ret = ccw_dstream_write_buf(get_cds(t), t->inv, len);
> +    if (ret < 0) {
> +        return ret;
> +    }

This looks correct: together with the change below, you end up
propagating a negative error value to the ccw callback handling.

>      t->in_len -= len;
>  
>      return len;
> @@ -260,7 +264,10 @@ static int write_payload_3270(EmulatedCcw3270Device *dev, uint8_t cmd)
>  
>      t->outv[out_len++] = cmd;
>      do {
> -        ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
> +        retval = ccw_dstream_read_buf(get_cds(t), &t->outv[out_len], len);
> +        if (retval < 0) {
> +            return retval;

Here, however, I'm not sure. Returning a negative error here is fine,
but handle_payload_3270_write (not changed in this patch) seems to
match everything to -EIO. Shouldn't it just be propagated, and maybe 0
mapped to -EIO only? If I'm not confused, we'll end up mapping every
error to intervention required.

> +        }
>          count = ccw_dstream_avail(get_cds(t));
>          out_len += len;
>  
> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
> index 821319eee6..cc1371f01c 100644
> --- a/hw/s390x/3270-ccw.c
> +++ b/hw/s390x/3270-ccw.c
> @@ -31,6 +31,9 @@ static int handle_payload_3270_read(EmulatedCcw3270Device *dev, CCW1 *ccw)
>      }
>  
>      len = ck->read_payload_3270(dev);
> +    if (len < 0) {
> +        return len;
> +    }
>      ccw_dev->sch->curr_status.scsw.count = ccw->count - len;
>  
>      return 0;
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index fe47751df4..99e476f193 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1055,10 +1055,11 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
>              }
>          }
>          len = MIN(ccw.count, sizeof(sch->sense_data));
> -        ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
> -        sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
> -        memset(sch->sense_data, 0, sizeof(sch->sense_data));
> -        ret = 0;
> +        ret = ccw_dstream_write_buf(&sch->cds, sch->sense_data, len);
> +        if (!ret) {
> +            sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);

I'm wondering about the residual count here. Table 16-7 "Contents of
Count Field in SCSW" in the PoP looks a bit more complicated for some
error conditions, especially if IDALs are involved. Not sure if we
should attempt to write something to count in those conditions; but on
the other hand, I don't think our error conditions are as complex
anyway, and we can make this simplification.

> +            memset(sch->sense_data, 0, sizeof(sch->sense_data));
> +        }
>          break;
>      case CCW_CMD_SENSE_ID:
>      {
> @@ -1083,9 +1084,10 @@ static int css_interpret_ccw(SubchDev *sch, hwaddr ccw_addr,
>          } else {
>              sense_id[0] = 0;
>          }
> -        ccw_dstream_write_buf(&sch->cds, sense_id, len);
> -        sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
> -        ret = 0;
> +        ret = ccw_dstream_write_buf(&sch->cds, sense_id, len);
> +        if (!ret) {
> +            sch->curr_status.scsw.count = ccw_dstream_residual_count(&sch->cds);
> +        }
>          break;
>      }
>      case CCW_CMD_TIC:

(...)

Otherwise, looks good.



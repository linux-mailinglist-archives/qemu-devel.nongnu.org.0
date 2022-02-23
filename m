Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B04C1B14
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:43:04 +0100 (CET)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwbO-0000Uf-V0
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMwW9-0007MI-5N
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:37:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMwW5-0006qB-P0
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645641452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=secfnCCluSyfSNKwwAxMrWbCmNJ72DL+wlfAdJq++wo=;
 b=V0qw/YPlDVC6v2B5u93Ssuhnmov+Udv1A1ayaarNtvgoEFXuoy680yj0Tl91gv2+bM4v6j
 J+zm5K+SF4NPxg8dtIRXDf/f1u6Z/7Wr1jn5E4h8FSOZcsqpvYwJL1OO7JkXWnRnHRy/sH
 f8ImX1PReUWFyOM9+7A5wb8EQREFgeY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-TvySmVvJPHC2NEg5gvRPrQ-1; Wed, 23 Feb 2022 13:37:30 -0500
X-MC-Unique: TvySmVvJPHC2NEg5gvRPrQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfa1d1000000b001ed9d151569so1799771wrv.21
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 10:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=secfnCCluSyfSNKwwAxMrWbCmNJ72DL+wlfAdJq++wo=;
 b=DiOa1TjNmUav9whPDQ2BjQ2D3DX8rgSgKAqhnUjkcPLD0yOEVp4yjDDx+e7/Z5xHY4
 iDNBLaIqRwxVSToDY07cO5BDZ4YIzNtNgR6Yyn4MRUxL8mKLL/mdLLgTCnNs1Rs6SF/M
 /0g4l3Vm49HGgWcIrr3CDFuXSt/bSrTffD9lY+DQVE/Tzbt2lNNdCcmA9EO1en0ntQww
 IyAeAtCpgK/AwjBe2P+hnEofcD3ILulIzxwbAArvO3VFbnh9YBxR0swo1zqRU/0BfUAc
 GNFV0sSOj05CRLy7/cl7Kxb0XOXw0J6+o8Nfczx3gZE/ZMuSsbw+bm1rBAm8QfBzIfVv
 NHLQ==
X-Gm-Message-State: AOAM530evNM5sM4ZWPZ10vYsoZsjPAushl78XkdpUpICTCtCVzqiq0gM
 xTFM5Hx6y7oyU9jNprSIzuEntIPkCpD85FJ2twL0iceJ0nX7TEkl0gfgv/XmCnnHOVKGvOp/d9d
 NoZBrctWGWw5usm4=
X-Received: by 2002:adf:edd1:0:b0:1ed:c019:2f23 with SMTP id
 v17-20020adfedd1000000b001edc0192f23mr708821wro.11.1645641449768; 
 Wed, 23 Feb 2022 10:37:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD3sSnTC6YpI94auGrN7wHwsluPisCVBzKbzWDzUugre93bZ9y4twV9S+u6yIwA1896BckAA==
X-Received: by 2002:adf:edd1:0:b0:1ed:c019:2f23 with SMTP id
 v17-20020adfedd1000000b001edc0192f23mr708804wro.11.1645641449567; 
 Wed, 23 Feb 2022 10:37:29 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o10sm377127wrc.98.2022.02.23.10.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 10:37:29 -0800 (PST)
Date: Wed, 23 Feb 2022 18:37:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qapi: fix mistake in example command illustration
Message-ID: <YhZ+562Zrz5NNgiK@work-vm>
References: <20220223180418.2098303-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220223180418.2098303-1-berrange@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The snapshot-load/save/delete commands illustrated their usage, but
> mistakenly used 'data' rather than 'arguments' as the field name.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Fabian Holler's patch from yesterday beat you to it slightly;
I think Markus has it queued.

(20220222170116.63105-1-fabian.holler@simplesurance.de )
> ---
>  qapi/migration.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 5975a0e104..1c6296897d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1888,7 +1888,7 @@
>  # Example:
>  #
>  # -> { "execute": "snapshot-save",
> -#      "data": {
> +#      "arguments": {
>  #         "job-id": "snapsave0",
>  #         "tag": "my-snap",
>  #         "vmstate": "disk0",
> @@ -1949,7 +1949,7 @@
>  # Example:
>  #
>  # -> { "execute": "snapshot-load",
> -#      "data": {
> +#      "arguments": {
>  #         "job-id": "snapload0",
>  #         "tag": "my-snap",
>  #         "vmstate": "disk0",
> @@ -2002,7 +2002,7 @@
>  # Example:
>  #
>  # -> { "execute": "snapshot-delete",
> -#      "data": {
> +#      "arguments": {
>  #         "job-id": "snapdelete0",
>  #         "tag": "my-snap",
>  #         "devices": ["disk0", "disk1"]
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F055F9C34
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:47:42 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpNt-0004sj-PN
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ohosz-0000Ps-Kt
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ohosv-0001qt-Tb
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665393340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Do6pagLbgffHmTLzfeKCvHeuLtVvi37l89LcAuVhn94=;
 b=F4wQtJoSIJwzpbGlhYhbNDa0Y0YE+ibpRg9oOyixsND0M3Oh0Srmqp2EyQmgS9Y1no6cHy
 uDzlCP9BwkBukJf8hJj5lScRmtTUmzxe0dtmzA5V/ZO5dvhhacnf3GOArKHRpd6Xd67Tcu
 +DjX2ZC75yRTpSZKjcj7XwDVTYxSVrE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-FcBF72uIOSGbp0vyL3yn4w-1; Mon, 10 Oct 2022 05:15:39 -0400
X-MC-Unique: FcBF72uIOSGbp0vyL3yn4w-1
Received: by mail-qv1-f71.google.com with SMTP id
 q6-20020a0cf5c6000000b004b1999f94bcso5976145qvm.15
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Do6pagLbgffHmTLzfeKCvHeuLtVvi37l89LcAuVhn94=;
 b=BFMxhghSUDsIp2JgaA/tofrAMlqhBVNHHJyQBat+JqhHD3+C58m0AvCcJQW8JhXiaa
 EevLSCXsmvxDhlW/Mdt9o9UvJsDou2fS1AMROmE9BsTI1xvipPFR83y7wcZzKMpl2jpe
 Vj9WYReIuLhib6jVUNOBVyri3+4nwa/H3ua1Gf5Mi7rpcoF4FFEqF+ahX96it0cKHov5
 z1yleVL7xe6aiKx8d69t2ipCCzTZpcYxYb7wu0SpnQl8SB/75imVLiQjDN625asRWCO0
 OyXteUCfJA1e6gmeCg+dhlTOvfAOB9Uqt7DiVtQ0pjcAqBKcjMA1/Nz4GSxQbkBefGF7
 hRMA==
X-Gm-Message-State: ACrzQf3TgjF9TLu8MK4NThQ2yw2S8zpmssfW1AGXm46EFzjzvkcDJSUu
 BOlbAVfCbkUG4Re6uNrDW8aPg5+x+F5PBmEzrXAY4PQcdltvTpPrtFuFmFr2M2b9bTu1mHrWjox
 H52sQRbAJZj5xmswKMa13FOXFrgJrhLk=
X-Received: by 2002:a05:6214:3006:b0:499:1f87:dac9 with SMTP id
 ke6-20020a056214300600b004991f87dac9mr14118445qvb.0.1665393338472; 
 Mon, 10 Oct 2022 02:15:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dH5JznpVo6Ut8E3Xe6hWBqToYRrP3/18RgmDAJMiNjmMJJjYxai5WN2nsmW1gTgn76S2UxFCUKtNIh3tKTMg=
X-Received: by 2002:a05:6214:3006:b0:499:1f87:dac9 with SMTP id
 ke6-20020a056214300600b004991f87dac9mr14118437qvb.0.1665393338267; Mon, 10
 Oct 2022 02:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220925204511.1103214-1-mcascell@redhat.com>
In-Reply-To: <20220925204511.1103214-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 10 Oct 2022 11:15:27 +0200
Message-ID: <CAA8xKjUcBk=M=09ZPXAv3RFZsd95ib+=UBXZDyb8c+NrmNemqQ@mail.gmail.com>
Subject: Re: [PATCH] ui/vnc-clipboard: fix integer underflow in
 vnc_client_cut_text_ext
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, tangpeng@qianxin.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 25, 2022 at 10:45 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> Extended ClientCutText messages start with a 4-byte header. If len < 4,
> an integer underflow occurs in vnc_client_cut_text_ext. The result is
> used to decompress data in a while loop in inflate_buffer, leading to
> CPU consumption and denial of service. Prevent this by checking dlen in
> protocol_client_msg.
>
> Fixes: CVE-2022-3165
> Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
> Reported-by: TangPeng <tangpeng@qianxin.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
> Extended Clipboard Pseudo-Encoding:
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extended-clipboard-pseudo-encoding
>
>  ui/vnc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 6a05d06147..acb3629cd8 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2442,8 +2442,8 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
>          if (len == 1) {
>              return 8;
>          }
> +        uint32_t dlen = abs(read_s32(data, 4));
>          if (len == 8) {
> -            uint32_t dlen = abs(read_s32(data, 4));
>              if (dlen > (1 << 20)) {
>                  error_report("vnc: client_cut_text msg payload has %u bytes"
>                               " which exceeds our limit of 1MB.", dlen);
> @@ -2456,8 +2456,13 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
>          }
>
>          if (read_s32(data, 4) < 0) {
> -            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
> -                                    read_u32(data, 8), data + 12);
> +            if (dlen < 4) {
> +                error_report("vnc: malformed payload (header less than 4 bytes)"
> +                             " in extended clipboard pseudo-encoding.");
> +                vnc_client_error(vs);
> +                break;
> +            }
> +            vnc_client_cut_text_ext(vs, dlen, read_u32(data, 8), data + 12);
>              break;
>          }
>          vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
> --
> 2.37.3
>

Any updates here?

Thanks,
-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0



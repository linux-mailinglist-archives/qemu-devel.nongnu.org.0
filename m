Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9247BBC8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:26:15 +0100 (CET)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaTO-000652-GI
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:26:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaSL-0005Ou-D3
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzaSI-0003E1-Eq
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640075105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dg4BIkjbnqL8SxJq2EOaNr/SLMbQZMXu4d5HqA9E2Z0=;
 b=PxsF26d9Lywecew94/oE0FQ5FBB3HovD//h/QXXB2eQVLwIH6pGBMLATeAC0LNkh317Qzb
 HdmHr1lok54Lgh+1oM/Af9CmRsmouULTriHy8AG1zACWSILWEBkm1UGLswVXpQiwQ7OWRc
 msYLvRNAgtHCv6rBAXsK/jNtWo0wO5I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-aWt66SHSM_ClxjnpUeXANw-1; Tue, 21 Dec 2021 03:25:02 -0500
X-MC-Unique: aWt66SHSM_ClxjnpUeXANw-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so925325wma.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dg4BIkjbnqL8SxJq2EOaNr/SLMbQZMXu4d5HqA9E2Z0=;
 b=1WHvAiVclJ36Ra8zIdZtJ2am1/6vZ/50vmW1Cu2/gZjwyDUnv51fGuDLN9gF3xAbwD
 kk++keBbqjV1ToB9ohpVztLIyP5YTaA2vJRCAN1zA77ANXPhV/Z1zUCQa8M97hL1FGNX
 zovG7+NK93kM82NVqyU+xzkelCzTRDi+ugFlBUBiMbnRk5WLmlOF2z71bEmrQkDMbqHy
 EfxZg7VkEx0puV1WhoHgkaSO4adsnMnlnPBwh2hs8CPYXq506XHidqoPVHzVr9P15NZl
 gGprKEzKQRi3Ib6F0+dlwY2QiztPdRlMwqljqKWe/48+XRBNZdsKuyqK+KT0QuwqixwS
 gaVg==
X-Gm-Message-State: AOAM531in/CFHbawXK4Q2iYfE53gHIPLXpwMvcp+IFvSMWQXGrGd+zGZ
 STxlIHh2NAkaCVqWHEiXgHR9Fvh6Y+ton0cMCsK2gGl24eP9gHKEnBcajwRArtJloTwGEAWvJKn
 49khAVHW+Y+DJVvQ=
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr1647246wma.170.1640075101563; 
 Tue, 21 Dec 2021 00:25:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywPrEbEd2anVRmNxnAxIr5Yc9YiL6NZGtA6FeR6ztCFg6XB4lnfAzk2B9YaKQ/c2j4nPY8SQ==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr1647234wma.170.1640075101386; 
 Tue, 21 Dec 2021 00:25:01 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m15sm17323973wrw.27.2021.12.21.00.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:25:01 -0800 (PST)
Message-ID: <d6a7cb7c-5813-158a-a86b-71cfab90402f@redhat.com>
Date: Tue, 21 Dec 2021 09:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] vl: Add opts to device opts list when using JSON syntax
 for -device
To: MkfsSion <mkfssion@mkfssion.com>, qemu-devel@nongnu.org
References: <20211220084544.54902-1-mkfssion@mkfssion.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220084544.54902-1-mkfssion@mkfssion.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Markus.

On 12/20/21 09:45, MkfsSion wrote:
> When using JSON syntax for -device, -set option can not find device
> specified in JSON by id field. The following commandline is an example:
> 
> $ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
> qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined
> 
> The patch adds device opts to device opts list when a device opts get
> parsed.
> 
> Signed-off-by: MkfsSion <mkfssion@mkfssion.com>

BTW per:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line
"Please use your real name to sign a patch (not an alias or acronym)."

> ---
>  softmmu/vl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1367..0dd5acbc1a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3400,6 +3400,8 @@ void qemu_init(int argc, char **argv, char **envp)
>                      loc_save(&opt->loc);
>                      assert(opt->opts != NULL);
>                      QTAILQ_INSERT_TAIL(&device_opts, opt, next);
> +                    qemu_opts_from_qdict(qemu_find_opts_err("device", &error_fatal),
> +                                         opt->opts, &error_fatal);
>                  } else {
>                      if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
>                                                   optarg, true)) {



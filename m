Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D1A4842D1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:53:34 +0100 (CET)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4kFq-000375-3f
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4kES-0001q0-J8
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:52:08 -0500
Received: from [2a00:1450:4864:20::430] (port=40597
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4kEQ-0002f1-OQ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:52:08 -0500
Received: by mail-wr1-x430.google.com with SMTP id q16so76341974wrg.7
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JOcWhMmLu8gI5sx6rdU83iF4Tk+cvB75qza9aKZGUOM=;
 b=DyELs5kDmC84jJKXDNAntMbgDzaKR8zcjdUAJmb8TmQkq7xKfJhfBkGeLG1sA6Vvh4
 CFCceq8csS5WFnHsYWg5vTRMl2+hM2M/vUQXD7XFfP4UCrr29hTDpHcO2zVlSqm7OxOo
 4diucQOpkxF//lNuZo1knjFP75RKAwv00aJPqa3VZn7+8XAr0udGEvRHI+QFOLOVpx5r
 qDcPKovUgLUc/RE3lbcGzR0WiZt8O4L/GOH33LweJ2Bh7+tjzcCyTJ0AdR/VpoLWUvYn
 7HsVk/qkWjwugzG4iKDbZU93ms9b6i/1a+PmIlazdbyJvg6YokA54oTeDKh7rG0o592I
 +3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JOcWhMmLu8gI5sx6rdU83iF4Tk+cvB75qza9aKZGUOM=;
 b=0pKSDo5waqOHuMZ1csgL/Iajy4RB1t2jvFmqRv/bnFDPntPMxdBpSJSR79y83lrJOJ
 dpbrahKIJ03HzzaZAsr0s7ME6dTw95ri8jt2VrOzwdra5Q8BlhvQDPn364yroZzOUwrv
 F5icYB0EM1Ai9eNQqXZxWJys1TOt6gCMNFlJRYkNd+9JkezTOilpj2dFftVnPj/OU3sr
 +7U2HHR5GuwVAEMAkptx14hp+OoGFUTpbcMxp8T8udBzCVWNDh5GwDkYsboJVzvcpcxU
 eU+IIGbC/4XZjaVcDGSi5icz+BN1FcmcRFqjP5mVLeT5QtG+euft2+KosVKnq0cxKCG4
 H2WA==
X-Gm-Message-State: AOAM533h/eE+TwsqRCqSaqJ7MDZmXZVGQ3yn1n+Ac+cS5SxkmhkoyFll
 2Z5uzPOqxNottb/d/v3zDJw=
X-Google-Smtp-Source: ABdhPJzce6MdmY//8N0d5BM/WYKNoOnswr/0YYnOLn46htDmelkt530lXW1dcPN9sm1k7qEEimfLtg==
X-Received: by 2002:adf:ef46:: with SMTP id c6mr44232615wrp.555.1641304324332; 
 Tue, 04 Jan 2022 05:52:04 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id q14sm37147178wro.58.2022.01.04.05.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 05:52:04 -0800 (PST)
Message-ID: <75dcc1c1-0566-8735-d42b-02d99994156a@amsat.org>
Date: Tue, 4 Jan 2022 14:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v1] Check and report for incomplete 'global' option format
Content-Language: en-US
To: Rohit Kumar <rohit.kumar3@nutanix.com>, qemu-devel@nongnu.org
References: <20220104134102.1080890-1-rohit.kumar3@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220104134102.1080890-1-rohit.kumar3@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: prachatos.mitra@nutanix.com, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, prerna.saxena@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Markus / Thomas

On 4/1/22 14:41, Rohit Kumar wrote:
> Qemu might crash when provided incomplete '-global' option.
> For example:
> 	qemu-system-x86_64 -global driver=isa-fdc
> 	qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>    	string_input_visitor_new: Assertion `str' failed.
>   	Aborted (core dumped)
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
> ---
>   softmmu/qdev-monitor.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..7aee7b9882 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
>       char driver[64], property[64];
>       QemuOpts *opts;
>       int rc, offset;
> +    Error *err = NULL;
>   
>       rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, &offset);
>       if (rc == 2 && str[offset] == '=') {
> @@ -1031,7 +1032,13 @@ int qemu_global_option(const char *str)
>       }
>   
>       opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
> -    if (!opts) {
> +    if (!opts || !qemu_opt_get(opts, "driver") || !qemu_opt_get(opts, "property") ||
> +        !qemu_opt_get(opts, "value")) {
> +        error_setg(&err, "Invalid 'global' option format\n"
> +                   "Expected: -global <driver>.<property>=<value> or "
> +                   "-global driver=driver,property=property,value=value\n"
> +                   "Received: -global %s", str);
> +        error_report_err(err);
>           return -1;
>       }
>   



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2D32E51E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:44:24 +0100 (CET)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI70R-0001Qk-NX
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6zG-0000ao-8D
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:11 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6zE-0006oZ-NY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:09 -0500
Received: by mail-wr1-x432.google.com with SMTP id e10so1309479wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z83zdFIIpV7X5Xy4G2KopmKVZ+p+hn+nMqtXxz7amYg=;
 b=CH/RGVb0LNw4oxpCnfOSiMmqRg+sKWezatuMeBc1ZJf4xvcWgOv6TX5aAAKXzq5d7M
 GBiSLguHD3VZpo4JPQehtlXgc/HjZQ7+/wCYPgIszbwvhVlc1zlTqjc7yEL2Yn6/YM8b
 /bcDNe42JPfjzYhKCgZqfRYw5Q8NoC/2WzGPiXapSuA/S0vtdyUhrr9cMCTheL6LPnnY
 Khowi7VTTQZ6PIvUaVuLsl7/tfIZQI7VVz8ysXh8M43Pji4dgr/aE3BUD3eGHlzPkh1w
 BcEXjpZ8vKpBhUsLA0oWQbPj2XpW/1/ZF9FkwcBGTZ3SeEV3CRe5W497+ieFKFBDS6Mj
 /dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z83zdFIIpV7X5Xy4G2KopmKVZ+p+hn+nMqtXxz7amYg=;
 b=UNIv7CJ4u+Bhv8oWCt+8ZhOaaRhx9yBbNT1BJq1FxX6uNKvm2JehSJ+QN6OElMdV1A
 1ElVFadxZOXJYnYNZ9wfqm8/leJY3PzGXQ+5hmM77hCdfRTJLh95kWyrCs6bq5kfnVtq
 M6jojgswz+Y20/T/MgFiCkxzkxqKq59uMcIPIcl8h2wFul3m8atCFhiuqTJapofMWzoR
 SG/qvQ/7rGXOIqh88OV9/HUfRhphPVxFLLR/qveujlBe0zF4vbEZY46lKHOH67OtM5LH
 vf9Q8HkAobF2fRmW5BvqmUfgAVSbw2hiRRVmIAQHYPBJ2gINrXKSOihNRlCa0nVgYonq
 tJFA==
X-Gm-Message-State: AOAM532rrlb77v/o46o9whv3iXnJkkR5Zg//Za6qefCLfbt37Xl3Jy4s
 QPWE6ca0jV3FqX8SbUTL+aQ=
X-Google-Smtp-Source: ABdhPJy17EF3RtdAUV9UUfxn4TozUM5QMaLnpQrf4NZynW833X5TgtFe1HG86WPG/RSwqBbK9kAjHA==
X-Received: by 2002:adf:ed06:: with SMTP id a6mr8223609wro.208.1614937387324; 
 Fri, 05 Mar 2021 01:43:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p18sm4092270wro.18.2021.03.05.01.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:43:06 -0800 (PST)
Subject: Re: [PATCH v1 6/9] gitlab: add build-user-hexagon test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <20210305092328.31792-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5d15e386-e0f1-d3b0-c7e7-5ed9dca1a7da@amsat.org>
Date: Fri, 5 Mar 2021 10:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305092328.31792-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 10:23 AM, Alex Bennée wrote:
> We special case this as the container with the cross compiler for the
> tests takes so long to build it is manually uploaded into the
> registry.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


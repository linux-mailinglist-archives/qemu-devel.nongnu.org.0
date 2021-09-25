Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3170B4180D8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 11:42:30 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4CT-0007NK-9H
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 05:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4An-0005rP-65
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:40:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Al-0007Fc-Or
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:40:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d6so34697479wrc.11
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZmVzybQh/8sIthz8qwQChVhlO7bqVY9OwaYAUAvR1QA=;
 b=QOSKsuzZkWUO4lXf1mg7/qC038vezSQ5VlAOHAo5A54ze0oPZoxbQbj272fWHM91tT
 pNN1bKDp0uzBBapDjbr9mrR8LHDVXOLvfA1N4DDKiVFn9iG3jWpz/AiYzFouYRtLx+v6
 oy/wY96cFIjvotcJlC0nzyML7IOQtaJnnmGsoXbqJwxDRIEW+IFi1qKuqyS8lnhfwEnR
 AWszJ13uIOPu4j0GB8084d5NSAZy7sWB3XxedTvwvYGVgkS+36K7ZjHkdklHTA8YcrXC
 uo00lVbqxqjPazIrZmnGHkOT3aIZJsiz3RryrYNL2MUHirFyn7d8C4XT5lUVsRuwbmdt
 GLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZmVzybQh/8sIthz8qwQChVhlO7bqVY9OwaYAUAvR1QA=;
 b=fVQrei9wUHJS1WYNyrMw3m9ADAkhtWOjiskbUTDrhbpfN1Eu005m6Y2rW0APPodTnG
 bQDcUz6bcP++i6nM+z6msWhjluvAHqEbwDXrk3u0c56rASLa8b+C9IBpgqjiubPz599K
 SRgEmLv0JF1aO33BjjlR97Ao05TkNZl+XZj5kWJKJcoLrMk75VhJzaZg/vLM6O9iNyNx
 X1Ufawdp9LgXAAdGznS3fYT/OE3nxh1fYT/2GmpRba6oavWq/VvVVW2W3sBUk7k29ZJS
 G05UztuHkQvNK1pXLOM7BhedbR/4AjCrUDFz8zpMdn0YsRZhMwMgrae6zqEGM++1QQsf
 0+mQ==
X-Gm-Message-State: AOAM5313JDhmrindsN7REkbw3mmQAi5j2vCOVYdF7w3nb4ILOFmVfTJ/
 3mhD5bcG0GDAiz2EnF3AchCOkfbNLgc=
X-Google-Smtp-Source: ABdhPJzqoQ20lHe5kIRa8SqLWzAMR3vmbJYehWh9CQ9yFwCNGKX+Fr+O+CN6TkpUiuhK78CSdviHHA==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr6163381wmc.181.1632562842428; 
 Sat, 25 Sep 2021 02:40:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o13sm12865040wri.53.2021.09.25.02.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 02:40:41 -0700 (PDT)
Message-ID: <57859abf-bab1-e68b-ed0a-22efbbaec627@amsat.org>
Date: Sat, 25 Sep 2021 11:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 08/30] tcg/loongarch64: Implement the memory barrier op
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-9-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-9-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


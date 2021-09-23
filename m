Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785074164B3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:55:01 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTSw0-0004tC-35
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSuq-0003tz-0R
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:53:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSuo-0008Bp-EJ
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:53:47 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t18so19652457wrb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8l+J9lWRLp3duQgDIldCgqsWxLvBKaXc1BZh2Y0i/M4=;
 b=Von3ClEFgQa1Km34dm7DOApFCFAmDkutNc7Tel7bcxUfa44kl9AIvXz/jWipXCP1cg
 kycgpKG4M4bJEKFjI/++gJg0poyrBWnHBBGnspnJgb0QU7sUWYYeTH5nVb432f20d2Pm
 5pczBAMD5iPXVT00TUb+Sdv4zlgl+s3IZlNRv397IDTG4hkOslpVcC7KQrRpKBmCmNzM
 e0STiBsyVb12uQRyGLuoMW41WKHmPo+1A3l7ezGsF8ERTSz/rTjjIT7gKTZv6mFIKtKL
 YmoHbxi6FCHiCk/kZO2UM23J6nrQMstA5iWD0z8F2r2a0co91xay67RDDaUts/M5pOjq
 WMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8l+J9lWRLp3duQgDIldCgqsWxLvBKaXc1BZh2Y0i/M4=;
 b=s+E79HOrfCX8PTc0jI04z68EnHhiUVyk19SE3SGZlvSZsePg7KIrEHsamswvrYIi7k
 hhmfa45t/n3VXnIfCGB+JYZ8/GbaIg0uuSqHNT6vEGzUjO4xZEdI+vPCkn11E3s8VM32
 5vSWLhvBOgQqqGf1GdFKVQopU8PhWFm13GInuQEwXXEBZe0xOj0eEX07b7A6NAh2sXVE
 v6GupkY6fYMfER2pqaUqvNDXO+JuJzxc1EpYkJX5eeWOlESYMqPCFyVYkDHIvnJTz8JF
 +JjcHan+LsqYpAoFZzdsrwCwAL7eeBhyR0LlvDAP2V9ey+0j7UzN54KKOOlMSzne7bYv
 3HgA==
X-Gm-Message-State: AOAM530vIErJPEAdLiGNp5E7Pae5VW+nCDrbvHTQ+0CpKMo+MBseiw6e
 PRn3ve9dsBFcgEq4UcrEWD4=
X-Google-Smtp-Source: ABdhPJwfri3qku9nc0uvJM63S0MhLrqrGU7HeEagqAPvsmt4iuPr9b+NQPeeDEajHBWEe2Pj8VvqZQ==
X-Received: by 2002:adf:ee48:: with SMTP id w8mr6613490wro.263.1632419624812; 
 Thu, 23 Sep 2021 10:53:44 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s24sm5615023wmh.34.2021.09.23.10.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 10:53:44 -0700 (PDT)
Message-ID: <b4e8a95c-5838-9655-0b69-1390534b23d3@amsat.org>
Date: Thu, 23 Sep 2021 19:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 02/30] MAINTAINERS: Add tcg/loongarch64 entry with
 myself as maintainer
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210923165939.729081-1-git@xen0n.name>
 <20210923165939.729081-3-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210923165939.729081-3-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

On 9/23/21 18:59, WANG Xuerui wrote:
> I ported the initial code, so I should maintain it of course.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   MAINTAINERS | 5 +++++
>   1 file changed, 5 insertions(+)

Welcome ;)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


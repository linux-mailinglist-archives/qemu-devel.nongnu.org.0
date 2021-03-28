Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58034BE84
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:18:40 +0200 (CEST)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQavn-0001d5-J7
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQate-0000Uw-HF
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:16:26 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:33781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQatc-0006Jz-U4
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:16:26 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w70so11204358oie.0
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dIp46QpDaqdqS/AQOf9nsaasH7Zgevf/ArCWXmoKSBM=;
 b=wMicQAcwaHv/VDrT6yr1kpMPAWIh6Lb3moo3/qE4YW8qC+Gi34t0jRm2EbrvNzL84d
 nQCDWVVe8ADUrb3GQ6GAX2I0Niv8MR0zofObFKwIfAYARKsy3QJFWwhHKde2PGofcQ9f
 yHUhPmkjKPRYMUmltksNAsWQTn8WRRJDxtWSZAyBWFLIPXfaxDgQAHudozNQctgr42pY
 cvjkXow/1EYmn5fDSF8+GswQaFCngMCoCeoSVLkyRcApVwFFPgI+TzRBpB4fFDmt38s8
 P4bbJJRCAjGArVMkfKfnNjRioaJisIzZiHtfhcKySSynN7F7CxfbGqt12b58KrVdrqxO
 wEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIp46QpDaqdqS/AQOf9nsaasH7Zgevf/ArCWXmoKSBM=;
 b=aohZAGVqewgPrVjveUcAlpxLx/1uTyv2JM5hkTkTnIwB6iAvq306kNBeB/Go70dbyy
 xFfWQ29qZqxn0O2EZLOPk20BgQqq8+MhmAgm7bo7VtC0oIUB5pAR5WrPdryNAMSCn85H
 kSY6nw/G6JGIxucAkqxLD5jqygDhGA+SvTYiwihJyBg29mXpD9uVOOybcoESOQhq/M+I
 w4gtNivYH9N1/EBLRPNZeWBaDjHeMmNWzu88paFXW8S4KdhJDTTdeDK8saYVNbBwU0BB
 0sKCDRznv4VXLslJn16amtf7fHMancUs+/Zolf8TIPs+Wt4B/CJr1WS08HkUiHItsIj/
 G1Xg==
X-Gm-Message-State: AOAM5319POpR9FRIblo003lfDkTRqxsNamTROAo6v/8XqYWm0dDC2OQ3
 Z0JZ6r311UhCxcxYkb9tTNGy0g==
X-Google-Smtp-Source: ABdhPJwEjCXONnWDJYImN1EFfEnRp51DheEqoHtZLKQ33W55yAG1oc85A4MiTOO6lp586NGv417zpQ==
X-Received: by 2002:a05:6808:f14:: with SMTP id
 m20mr16778800oiw.13.1616958983827; 
 Sun, 28 Mar 2021 12:16:23 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x18sm3826205otr.73.2021.03.28.12.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:16:23 -0700 (PDT)
Subject: Re: [RFC v12 64/65] target/arm: tcg: remove superfluous CONFIG_TCG
 check
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-65-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df3b7c1d-968a-8381-1726-867555f7c7c9@linaro.org>
Date: Sun, 28 Mar 2021 13:16:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-65-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:37 PM, Claudio Fontana wrote:
> modules under tcg/ are only built for CONFIG_TCG anyway.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/vfp_helper.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


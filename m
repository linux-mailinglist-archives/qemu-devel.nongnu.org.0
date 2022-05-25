Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D845345A8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:10:05 +0200 (CEST)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyGa-0000zp-CD
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntyCM-000787-QW
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:05:44 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntyCF-0001US-H5
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:05:36 -0400
Received: by mail-pl1-x636.google.com with SMTP id m1so19626269plx.3
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 14:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zFjyTdVXOVy/uefjxe3RFGea5bouomI4CYn+czP5Edg=;
 b=dE2ULnLK3/owGB/nhUtAZphkvVb6wknbTw99S5In19LU4TSiGjYs1gt+GnmQ+SKVTc
 zxWL2dAuPrnD4/NMWb0+0IRCJzMeZVSNqn+e4qS2LvDskCsNhff8gFEWLM5/NZUBiPgW
 RmIm0KOIl5JcYR89BXQ/vKNKKyjWkOm7BchL4Va1OM+VZ3xTBcid+Du352jbCA2Ng0+g
 djBtGakcNvZHHQQD2nOWrd236PdgEyEagXrjXIgs9Nb/lL+jjtlKcvEcSGwVcT/gp/V/
 i0FYONuKoOvwUl5VFIZtIKOdvI8r5bv/EtLz+L3iZonVm1Z611BzWb1F4+PeCIWT+E0h
 W8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zFjyTdVXOVy/uefjxe3RFGea5bouomI4CYn+czP5Edg=;
 b=S9geH7OjUgEmqnIaAtN9bJJ2BKjypHsCAvbI4V670feu3XHeKn84q6Ne5Z4bN3EVSy
 UzM/2Qpnv82c/TLFwbhhyVOkzgQ3JwZ8nLSqdVcWW5x53A9LG3Rl9+9vQo+eYMO8HEic
 7oVSyRpDl3T53jBOqMEuvH2mrOR9kOnX6dLQ24JwwVzPWbhO6rFG/C59lzmXJPpryD7c
 /+WDM1Qxafw59MMALZwMafqWgU97kuaNXYXHuv8fqtNtwNJPWoaSu5J0+KSGjsP97gYN
 IrLEvIxK8Cst0lDbNtfsWQUnCxDNEg6C98pj/sZ+whZfijE6YtTVdTdeqMspLrtK5nrj
 EQIQ==
X-Gm-Message-State: AOAM533uK4T0OMjCIiLP93OwnaZ92uLp67rzuPsR6qxZxQK+EYgN+386
 WqN78AbfWjN8rzmTgjZHPeCNqg==
X-Google-Smtp-Source: ABdhPJx1EaHJX+1Iu4ArKcMqCQ59WcBKkNDRaX/rOiuWbd+Lo2ggitbDoOocJB+FVEfw0TxsFKE81A==
X-Received: by 2002:a17:903:2341:b0:162:17b1:cebc with SMTP id
 c1-20020a170903234100b0016217b1cebcmr19416944plh.106.1653512733700; 
 Wed, 25 May 2022 14:05:33 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170902860500b0015ed3a112c9sm9675554plo.280.2022.05.25.14.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 14:05:33 -0700 (PDT)
Message-ID: <21f9b97d-ce25-0838-dfab-fc1a36aa14d5@linaro.org>
Date: Wed, 25 May 2022 14:05:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Content-Language: en-US
To: anjo@rev.ng, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 mlambert@quicinc.com, babush@rev.ng, nizzo@rev.ng, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
 <87czg11s8w.fsf@linaro.org> <67c27109-2bb4-7147-ab7d-215b6b03b4cf@rev.ng>
 <dbe09d66-dc14-c37a-af08-2378a4640e53@linaro.org>
 <2eebbb25-ef43-2f9e-245f-3aaa37c711be@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2eebbb25-ef43-2f9e-245f-3aaa37c711be@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/22 13:27, Anton Johansson wrote:
> On 5/25/22 22:16, Richard Henderson wrote:
> 
>>
>> No:
>>
>> * one patch to update libvirt-ci and does nothing else.
>> * one patch to update yml template.
>> * one patch to refresh.
>>
>> Just like you enumerated before.
>>
>>
>> r~
>>
> Ah, right! Thanks for clarifying. Should I keep all 3 patches in this series?

Probably easiest.

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661443484A4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:31:45 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPC2S-00040s-G4
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC0P-0003Ae-0C
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:29:37 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:33619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC0N-0006xu-M7
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:29:36 -0400
Received: by mail-oi1-x229.google.com with SMTP id w70so168219oie.0
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g6CPbCo5PuD4+WuKnWcr3hsYhdfENQEG3SGpWucoWsM=;
 b=Xr+oj5YQLI3kG4F9L8GNL0f+gPcuPSctiid7nYMGwzOxA10+R3e84+iwQLlDzb3vLE
 QX4uW36yTYL3dWF+bOr5sXrPQZn/2lZ1xdlJ3/dUdbjVBjzJ8yj36ckBg6qXLtvSf/10
 CEAWZhGDpn4w0au5NRq6huKuYzVLBcg2hkAgdw6NKnwUjFHxzJOs69IkDSMedhFbxaag
 /0/BNtxpCVaRQKZ64IlP/vJ6EabBhfwTUiHSXJnboWus0cHAC10rS4cp8/lZgBRjc8Nm
 rUUqm+YqUDhsEG+MYqgSuKxDp0J115/XZb1FvfhWPLv4VeNrwFi3yi+Rl65/ZvMhGEaN
 Mxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g6CPbCo5PuD4+WuKnWcr3hsYhdfENQEG3SGpWucoWsM=;
 b=qoEKSXgeyMbRIx0OOMytqvA79P332CEQ7rA23nwLFES2R7+lP++V0NsZxK/DGk/uSI
 sDdsp2qSSeVIAsk/lMaAYetgqrsJSzHWw6pksr7j9xmTyMMBupCukjmgkkwKO9cTGHjT
 yM5BTYXy6VqQXUX2KguHPVz5lXbXEmEu4FVZsoNe444wehS8q5aD9ohD+UC3l7HjlIfo
 5Vn/gwYuh/eVTTu7QUgSGOj3hXLXiw+7Oj8ntDUCDGDm9dB/2GMdGomTgLAejKDSxl68
 JSA95bdHW2McZwKHYT4CExxwKTCWWFhElqTDDxUmE2umP5QIobiv/QLiGzzCZx96pv47
 QTiQ==
X-Gm-Message-State: AOAM533xebr5q9RILmycfOaFk+4vEHwpGXL70q/VPPeilrXeZifPAlor
 7pkkemFdjRfYtMsDlVHra7qF3w==
X-Google-Smtp-Source: ABdhPJwVazfaKHyVmsOia7BIqRN14U02LcEKI4U1WVKlQCHpW/IfOOb7UnbjJB2vr8ZXV+KGiPgh0w==
X-Received: by 2002:aca:d70a:: with SMTP id o10mr3570822oig.143.1616624974526; 
 Wed, 24 Mar 2021 15:29:34 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g11sm887456ots.34.2021.03.24.15.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:29:34 -0700 (PDT)
Subject: Re: [RFC v11 29/55] target/arm: cpu: fix style
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-22-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6abea9c8-2eee-96ff-0c86-f064608fd355@linaro.org>
Date: Wed, 24 Mar 2021 16:29:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-22-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu-sysemu.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)

Obviously, this should be done before the code moves.


r~


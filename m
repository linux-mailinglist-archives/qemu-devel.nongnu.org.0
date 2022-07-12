Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1905712CC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:09:24 +0200 (CEST)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBA1K-0001YY-Qk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9u3-0005bq-N3
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:01:56 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB9tx-0003ig-6O
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:01:46 -0400
Received: by mail-pf1-x42d.google.com with SMTP id o12so6722210pfp.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=rqVqM1tiE3r24NyX3kzvNXvnuwfIHlOwH0bvGvgSgh4=;
 b=HmLf6fUyvBiRoYZd7Bl++O+hp1gt6jYeqXZ0fLOh/dEh3vFVVid7PzWyogdVmV1zRs
 hEclYTObukpzMX+IPf1bzji7ba7SL/fgHkhx4lt9ETWksaMregNoH5cR0+jFF0kc1Xua
 TwuyeM1hjpVvuuDWWt+iLdw9Q1sL4U2eD1nbMQnuf7msSDWFCAfKwAtTn7GJW/T/o+T3
 fUe/jSczIywGjJFRJdGQ1JiOlvgWsXIW1tUJPX7IKV2wOhdxW5f7FVB4N9329ASgYg3R
 Q23p3d8dQx/1TwfpP42xAthYCaDWirZYqGj7A5KMGWogrQ+HFBHa+yE0MFn5ctZOUS/o
 Ltwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=rqVqM1tiE3r24NyX3kzvNXvnuwfIHlOwH0bvGvgSgh4=;
 b=SSoR9KGnTUU9TygRzr2VXiw1tJhzcyr2opcraxAVdDmBekJ40SrERJZDgEyLKhcUwe
 VxWgYvh1ufVBX7W4B/o2oS8j/Tu6YmnJdBDgcMnieFXyzMuaW0okkyq0O+2ysK2O0AsR
 +U55srcvqlGiQRxWqkx7Ec5xJzrFp6QluUABq2epfs0WCcWAF1J8iuse2+rxAfUOSrsC
 N4TlJMhWi0iJHbyJ3d3Dpo6MwUvdgg+20zF9SlZNcY3mSi6vmmgSO83a5exdGNmGZ0C1
 D/GkxKTjZHYtPzzKo0XQJomstl0aBrQGmNDGd4eEFV6UwG3FSjDZ5/Lcr1H1Ew8rlvxw
 tOTA==
X-Gm-Message-State: AJIora+NxZ7ehbGwJwfSu0xJbJsSFAZJ4RzMSkRJAZ8GHk5dz5WGXqZX
 DccXiYUMk5b4dG+MumT71d2fmW7oi8PWduTm
X-Google-Smtp-Source: AGRyM1vQBsYQ9zGB09n/egQB04CVpjDRjsKnOC4trt1+O9fZVbUDcou7X+iT8A/N8rsMGvSHm1OimQ==
X-Received: by 2002:a05:6a00:852:b0:528:c669:ad65 with SMTP id
 q18-20020a056a00085200b00528c669ad65mr22082808pfk.75.1657609301342; 
 Tue, 12 Jul 2022 00:01:41 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a62d10a000000b00525496442ccsm5906362pfg.216.2022.07.12.00.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:01:40 -0700 (PDT)
Message-ID: <7cd15bdb-578e-4d28-6c8b-a101c9f8f4e6@linaro.org>
Date: Tue, 12 Jul 2022 12:31:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: lcitool update required
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi guys,

Cirrus FreeBSD builds are now broken, because we're trying to install py38-* packages that 
no longer exist.  There was, yesterday, an update to lcitool that addresses this.  However 
in the meantime there has been a major change to the way lcitool is packaged such that we 
cannot merely update the submodule and 'make lcitool-rebuild'.

I'm planning to edit the cirrus ci files by hand for the moment, in an effort to re-green 
the ci, but please update our automation.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88367177E97
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 19:46:49 +0100 (CET)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9CZ6-0007Cu-Je
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 13:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CXo-0006TN-Bh
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CXn-00067K-DN
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:45:28 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42327)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CXn-000674-7s
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:45:27 -0500
Received: by mail-pl1-x643.google.com with SMTP id u3so1714662plr.9
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 10:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gWdt942TTAru3QvsTFX9oaY5h68pwoHX5OAPrsatGLo=;
 b=Yb9JnmHzR9hcI/AGvCaQ5Pzah4G/kZWh+r4ENC7fF4R6oGUEX/y4K9KzNdvs99p+lE
 6nqwZjh2uBIbYnPHkTs33gtZH96rsCwKOzPHd7h5IvMQZjB0xTesk5ZjfpEGiBwQsSpF
 FzISBGeUMXAvbYeP/xqOJ75T1cdql1tIb9rOa0svsdb6Fv/64CkSs4xt2J22uiS0WAH+
 7lbzAMxpxnwMimboRf6wxwCuUpDXeGeU+szTjpIM3h6nQ3VRkO+692QmBcwKLzO1x7KA
 X8OeknSQTknsCPgsvn6HDaf5Tf4LCSBE3Rlbsi2dTGdMKw8wV0lxMiubKV0+7uIasKc/
 U5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWdt942TTAru3QvsTFX9oaY5h68pwoHX5OAPrsatGLo=;
 b=D2pSuuPcNqPplbqtv16prqYvG2EAjYCT3l8B7WW+ZhZ5QzeL0KqMkLQhFrBKGIVLjY
 Gl6IhlPaibLieNDZh3TckvUJztq7lv3I4BD5pBBdk1ACc/pU+5AGHqo/QpR1YDkJj6rx
 zjSYvmB56X4CTVYPFnm7QOG72/S8B4B14PWf/q0LO7EKlMtUwy3PSvz+D4857is086on
 /AYH9B+mcZ5VWGvjs3EI6BGW8dxC9qaxsoTRfCgkNvnLcH6En2Zs0CeDjoOgc1KXFjmD
 GdanlJgT1x7SR7GN7ThXH8Be+k2UbCzKmuBZFFJ552HvlfFtpqBbxHe7sXFUkyhgWJDr
 qb/Q==
X-Gm-Message-State: ANhLgQ0XlK39Ky4Njg0KNHWO+u1LqHPjWIrOtf8zIhVZQOah0twc0GuE
 x4J4d6zUiYtpmJRPBxKQ5M8UjnF1Qtg=
X-Google-Smtp-Source: ADFU+vuqmeUrmcx5i/OVPr9TacDblMtkAGOeVxURqXl6fzyVkwSDypZrXRlp6lab8Qy8BHqdRolV1g==
X-Received: by 2002:a17:902:b909:: with SMTP id
 bf9mr5204537plb.96.1583261125682; 
 Tue, 03 Mar 2020 10:45:25 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 136sm25237503pgh.26.2020.03.03.10.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:45:24 -0800 (PST)
Subject: Re: [PATCH v2 8/9] tests/acceptance: bump avocado requirements to 76.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200303150622.20133-1-alex.bennee@linaro.org>
 <20200303150622.20133-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a99a3944-a3eb-99f0-714f-bdceec4862bf@linaro.org>
Date: Tue, 3 Mar 2020 10:45:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303150622.20133-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/20 7:06 AM, Alex Bennée wrote:
> If we want to use @skipUnless decorations on the class we need a
> newer version of avocado.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


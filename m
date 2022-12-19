Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4B6516AF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 00:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7PQG-00022D-3I; Mon, 19 Dec 2022 18:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7PQD-00021q-Im
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:19:49 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7PQB-0006fw-W1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:19:49 -0500
Received: by mail-ej1-x62a.google.com with SMTP id vv4so25344430ejc.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/uKYPqI2SCf5dRBR3n3le0vpeOxQ09bnZ8c0F94Vv0=;
 b=t6BeFu32DUtMvSEzIgTCnHfiVX4UGkwW43u1rA+HHPmIg7mUvMaqSJ9fvHcqDZgmbX
 MJnSnI3MLEl9zDThBUcYy/frOIJpVGa8OHwti4VTWXWSV/oJtqbT7CK62W9xuKAh5r0K
 zN+Z65rj5GuiNmTyWzm+saOr6HEcioHKxF4jOy5O/Qnqkc+hM5zaGLc2pgeswlM3roc+
 /g6wbGlNqP4IENrz8wHvprpqd+OX87b5FmYUl2KQqURiqq1cc33wPPIdGIvlHD3NFq4x
 67aRg0ZPi1FLrWlD2w41fXbUQEQ+GHhBxHioACLD8LhwZSTHInRtiAlPfp121ceV/S15
 H2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/uKYPqI2SCf5dRBR3n3le0vpeOxQ09bnZ8c0F94Vv0=;
 b=EllERMrvL9ukNdZbim9+6LCEygdCriR7Ru0xisWu1eJJIktDBX6CnU3kHSgeYXrtly
 ObKcdpw+n0Cxd7IKNtnVxX7MSU9J2Y7nXxjMsTz4t/IlSbidbvumF2Pc3xhe8YSHgWLZ
 5U5pwcYbkt55qMh8ztcZh+iihur6mQQzMdsG5aJ473enp613IvMwY8ql78rcR13NG850
 PgJLnwRikSyXGpXveW2nHHiMibWN2jAZDrujkyX5qcm/ZUogyHbCzg9CqnqHjbBvOzu3
 fdVpLhEaQGOeJjMXpoDdc1I6KGn3P2Z4cJBUMR1XYmd48L9wZwgqhfRu7ORt9Bu1GVjY
 M4IQ==
X-Gm-Message-State: AFqh2kq9vusamXJBfnliEixpCPZmVLs514kebjh/S8Hkx0LDMRSVl6h+
 VEfi57FB6/MRQpbhujNjJDU7bg==
X-Google-Smtp-Source: AMrXdXttDMrs0QocAvpWQkGgJWOTN5AhzRJbpIrJ9vtw3EKRkeUiei1iJzrFCdYRpnbAKYnXkUK8JQ==
X-Received: by 2002:a17:906:ecf7:b0:7c4:f6e4:3e92 with SMTP id
 qt23-20020a170906ecf700b007c4f6e43e92mr134366ejb.31.1671491985178; 
 Mon, 19 Dec 2022 15:19:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mh11-20020a170906eb8b00b007ad69e9d34dsm4932588ejb.54.2022.12.19.15.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:19:44 -0800 (PST)
Message-ID: <efcdbcb2-87c3-870f-5462-fad7a276de7a@linaro.org>
Date: Tue, 20 Dec 2022 00:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Alessandro Di Federico <ale@rev.ng>, Paolo Montesel <babush@rev.ng>,
 Anton Johansson <anjo@rev.ng>
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 16/12/22 21:48, Taylor Simpson wrote:

> ----------------------------------------------------------------

> 12-21)
> Instruction definition parser (idef-parser) from rev.ng
> Parses the instruction semantics and generates TCG

Building QEMU with Clang I'm now getting:

target/hexagon/idef-parser.p/idef-parser.tab.c:2197:9: error: variable 
'yynerrs' set but not used [-Werror,-Wunused-but-set-variable]
     int yynerrs = 0;
         ^

Regards,

Phil.


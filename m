Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475E43CEF1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:47:24 +0200 (CEST)
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfm5C-0004Wq-To
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mflUi-0007pT-Ry
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:09:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mflUg-0000wT-P8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:09:40 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z11so2320326plg.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nDLNw4NzS+OFYgWzLcYqyaTGLZjSdDHrGBc5dzBeZk0=;
 b=ejc68wehlk3efGD4lZMwGDDQ3insSq76684T6lHIeYJxwfiKT6+W1/ZxTjF8TD1GV1
 0nZ7yBuhAAAnDaZ1MaCKeq8btirkrWhkDMPUBPBPxXyFiPem1a2l7LBLn7+AS4wpJPob
 3XSYRqNIm06BVKI6l/I8DO/G/RGQDi+Bch2o6cCHc5KfbwK/X9UDNZCnS3ANTa/LkvyP
 BW4nwPvKT44Ie1xqtj9IGiik7O5chVQhTES9SFLzdt9OmzCnv69J8jLCJnFm1h6kxZHZ
 htwLwU12kjcGE9XqJ3EkgGyKRoVYWgqvy0h8B6thVMH1z0aDFipbi8wqGdi1c4AJQ6A+
 RScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=nDLNw4NzS+OFYgWzLcYqyaTGLZjSdDHrGBc5dzBeZk0=;
 b=loUsSiTFGddY7o6jIv2SwOxgDFQZCrJLDPRP5KF39Zqspzoc0RdwOCPxMM6EQFt/wq
 uu+J0/UL03tIb2VvDZNDU7foG0+EDXEPrjaezaEDxUMX6oF2a1qkNAmwWFMzFAvk+3Ks
 wE8IH3CSSqXlT2NEHOEp4aYNKLaxV0KLCAc1Oe2Bxuqe2FhvUiIfquDHzmeZs8w1lJf9
 3s0lMIlKhBAmRPy/2wZzvOexPz7CPxL9Tq8zRoUl0vk8mWK13qVCNn2GULtTrImm82KU
 iLSaUquoURT+YkwZRVaYPhQ2onUlHp92KHEjp3WQjOO9PnqwPMEoPFRVAdHqro5+CQ+8
 inMg==
X-Gm-Message-State: AOAM533ZTR209X+OqcpWr+Nn0EM3lm/ZBzQfWkmDzJDA8bEDNUXXEjcT
 c0ZyoLWEvFdxlhjKNc5fb/q/jg==
X-Google-Smtp-Source: ABdhPJwG0ho/0QfyK/9yP3eE3x9kITiw+dGLZSZK9SLz04ZUVKv+9ANofxlAu5j7lVsgYzM9ILKAnQ==
X-Received: by 2002:a17:90a:a598:: with SMTP id
 b24mr6811302pjq.214.1635350975556; 
 Wed, 27 Oct 2021 09:09:35 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:91db:7d7:39c3:b8a1?
 ([2603:300b:6:5100:91db:7d7:39c3:b8a1])
 by smtp.gmail.com with ESMTPSA id b13sm5195379pjl.15.2021.10.27.09.09.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:09:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v1 25/28] plugins: add helper functions for coverage
 plugins
In-Reply-To: <e26b5d8b-fe12-c0f5-0cd3-6a2e7421c0c0@linaro.org>
Date: Wed, 27 Oct 2021 10:09:31 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C94810E-93F3-49E5-B4F7-995C41D64453@gmail.com>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-26-alex.bennee@linaro.org>
 <e26b5d8b-fe12-c0f5-0cd3-6a2e7421c0c0@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=wlosh@bsdimp.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com,
 cota@braap.org, Ivanov Arkady <arkadiy.ivanov@ispras.ru>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Oct 26, 2021, at 2:25 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 10/26/21 3:22 AM, Alex Benn=C3=A9e wrote:
>> +#else
>> +#include "qemu.h"
>> +#include "loader.h"
>=20
> There is no bsd-user/loader.h.

Should there be?

Warner


> r~
>=20



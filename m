Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321966B3C65
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa6a-0004gX-8t; Fri, 10 Mar 2023 05:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paa6X-0004RH-Rp
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:36:05 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paa6V-0005fv-7E
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:36:05 -0500
Received: by mail-pf1-x431.google.com with SMTP id c4so3363126pfl.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flN33Ai6RyoSXxrN9t3yzf1+mU3XkHkMfabywffEChU=;
 b=n0u8xlz8rq1NHOOwIlI6ISlZklRYJDcf1Be4zI6xDfI5A1m+BNkkLVru2UCpQzV9TU
 ei/U2tKwCYILTYz4kAaWrj9lziequcr+Bg1Ozd90HqlfyfglVoNmyi+DwMGV6B2Yfs2i
 zeoE4HHqrz5gcCT851X+H0BrhhYjaUITlUoqJP5iqOKckPnbYtMbnikh8SZaSmI+89Ev
 CCf06dCBdVUcMUbEufEqqYxDwuqZWS+Pb0mVNviDL/W6ZGmm/PGO2moaS5nY+uwpaXWQ
 6Y+cXLrq9V6HVYZHS9UyfkBYXIM7ZWcpVqetRzksa5nhiKBHWhnk6C6ENroJux9UHOHn
 ygHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flN33Ai6RyoSXxrN9t3yzf1+mU3XkHkMfabywffEChU=;
 b=pi8VFm89Xt1OHEn/fAQLoYFMVh3uW0JFiZwIv66zxyUGPr6N7hYxWHOGDCJCsym/Kl
 kpqvbi4BdXOKPTGEf9rnLo0BFr7jnXex6Zuch+FjdN7VvvS4fKrnCGg+xicWlP0+063I
 Q1nkpxQgFX+fNl9GeOe7EPfiEsPQGjy8IMT7azqktwUFs9uJPyH7Fz/g73F7AWUaNdJn
 njbKCv3h/fEkg8VCXFSZaJDl2mRpFqf0Yo8cygAWlDMb8Ser/tU+uV7K8M9vnWnmqfP6
 Orqj7Y91V8Hasu01tonwxXEX6ljMcKwiooEoJ76J6kkNup9r1EfaIQZd7djdg5tlUBKi
 3Tgg==
X-Gm-Message-State: AO0yUKUIYu7uJPWyUp6EZw4FTqPfjw8eEjMxLtnJigOYk1oiYyLRujnI
 5zuuYeFNUzZyvxYdIc5sgeml3aFVGfxhFr8lzPPBAQ==
X-Google-Smtp-Source: AK7set96HO7g1y2OLK+dVD0sY+/K41+7xofYvESgPS5A0BROHxZ+JqzSUDqgK/QLqyV8O99NxmghaIva73+3JB1IMbA=
X-Received: by 2002:a62:db45:0:b0:606:653c:f19b with SMTP id
 f66-20020a62db45000000b00606653cf19bmr10153318pfg.5.1678444561772; Fri, 10
 Mar 2023 02:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
 <SN4PR0201MB8808E9A0E003B8176A8977C0DEB49@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808E9A0E003B8176A8977C0DEB49@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 10:35:50 +0000
Message-ID: <CAFEAcA97VYT8WitDkKe0na8a2iJ=oGHs=JawiRN_HvCqR6_=qw@mail.gmail.com>
Subject: Re: [PULL 00/17] Hexagon (target/hexagon) updates
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>, 
 "stefanha@redhat.com" <stefanha@redhat.com>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 8 Mar 2023 at 19:36, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> Just checking if this is on the radar to be merged ...

Yes, it is; there's a backlog at the moment because of the usual
last minute rush to get pullreqs on list for softfreeze.

-- PMM


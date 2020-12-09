Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1A2D40D6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:18:17 +0100 (CET)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxU8-0004xK-DK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxSm-0004VW-62
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:16:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxSk-0004Ba-KF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:16:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id k10so1113992wmi.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FGo+t5PjEx5Vb2RCg7sSL0ADZ4YAKn5EvR19d1oDyX4=;
 b=LHlDqwX+sq9Ogm0QRmwFVRknioxLXEH0ifsWAAOnGWDYFZU5rLQzNK4GeYezt5G/vU
 HZZhyrUezLMieQSO+KbYhMHfN7e9/NehMPfDxGVpPNHKpOXkBGltoQGLAwihN00vwpur
 g9OF2nL91sd9CKckqFpwqK3VXopG+hgXUhxEd9yC+3dsAwqdjqODw6GO1vCKnIjTbpSf
 auEr8wTzLqCrWRvgypcIhyYTXr+hn2qIeQ0wQhS43yIlmsty1HlcJCYrgMKhHHBoK29g
 cfGbVRz2k08Eu/fSDJ55xZzxgvKO+Mqj3lWuNBHgHIDlnnJiHoRninqkfNSNXqTe/ckv
 3XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FGo+t5PjEx5Vb2RCg7sSL0ADZ4YAKn5EvR19d1oDyX4=;
 b=C+k9vnfodXbIoneRHD2qxMoX92rezZMN1yEcaOIxupsj93Varw8EYwUDT5gFQAPpDd
 P/Aw1CKGnJdSSrrysky5/2++zVqDy3EkzHJ/Ts9CGll+dmDUjsotLElGnYLHx7TIrOdo
 PjhWrM8pvQ5Bx4gf086709agwDiRTsxqdR4WFrUfvjY0zufmRAT60lv08kltVtWbnD0A
 s2mYujcjccnJyIg8ZK34tEEsDRl3hkwlomZY3OkhK/J29EIELImd1ao2Oa8XE7H+O18+
 +JDvsqjNloiyykIbRodj1JtPMWXHG6CV+fQfOeQXVNeiimfmSQc8AjUdJ9eQxh0rYGr3
 SfWw==
X-Gm-Message-State: AOAM531Paiu2UXUnp9MXq+N5bnjcjAZK5a2YSjnesE/RRw99XiFk5dZT
 zfA6x28OJB9kxi+BK2xgLaha1g==
X-Google-Smtp-Source: ABdhPJw5oEdURjHeOJl6qFIN4NbNIT/wqWloHH0G0lTREIb0iUk9S/KDCCcyb+a5GcRKD02QQIF+sA==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr2232683wme.188.1607512609009; 
 Wed, 09 Dec 2020 03:16:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h20sm2646899wmb.29.2020.12.09.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:16:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D97201FF7E;
 Wed,  9 Dec 2020 11:16:46 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-20-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 19/32] cpu: Move cpu_exec_* to tcg_ops
Date: Wed, 09 Dec 2020 11:16:41 +0000
In-reply-to: <20201208194839.31305-20-cfontana@suse.de>
Message-ID: <87ft4fdyap.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


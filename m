Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805792D3E73
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:21:27 +0100 (CET)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvf4-0006Nk-K7
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvbq-0004Ql-D7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:18:06 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvbf-0005E2-A9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:18:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id 3so860080wmg.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=pdHcAxLd3Cx4Z4GRqzGRrN2j5RvL8hAcwI/XLc9BaoYzVOiGGcsy2tVgWxOo40R9tt
 ai7Un0tNOHvoclHnyI+gEKvRWUG0FTEG2sxGH889+dAT+XgbUXdL3VcT6EKZO+wGDZH4
 Juhebsd1AGy994thWFsmObk/yNUy29DnoSST7k+KMBNbC555CYF7VxbX9MMRhWOCaGT7
 NW5Hy0K8lIMcLr02qjEzr1HBXbzAKtFngNbJhook9L6lNky8ji76nxz9hFBySypLpIB2
 TQ6gvGe+72YpUDYTSWJIDL913eWJoDWsPllOvwe9n7y7XXRDSlaDpp/9X+ejHNksPFEG
 fopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=rgjNGjISR2xNIR8YnqvMGjdiS+xQ1IajyP0cURV66g566s6OeVEQZ3QhkV4uzjDyxD
 N2nQPyN84yf4hZfuQ2I5jxxBI9kIiulUW1zDa5cHlRPlFJ0K6keBoehWoVqgotX1gNEb
 khOux55KnR63UtPR0m46Fyuaxn2hL8TPOrjbB1kB7FwytJiw+WhipxWoOOSiBBI38mPl
 vDiMTsEJzqVrHd/QMuOmCnDtjfdbeHUae4HCx1j4K5S+4PMM58GiDz5I+x0RG3yiqqHy
 HCD+KzXyPyk4HK/l6HeykKpV7uYsZnMuY2YcPZgiB20V5WWzY76226pVbKc221yeFCNi
 nfaw==
X-Gm-Message-State: AOAM5300ZVWiNO/4I62oxGH94XT2dvHA2V0QHbrzdw83fSGOwqgqnioK
 sGpFgFpGUHRQMD/tL0vI1FWmgQ==
X-Google-Smtp-Source: ABdhPJyGq2Iq4TGneFAnm71D/5ZBSwolPXOIhPFacXUJJDMk3E/1Sc+ThFi7U0n8KETKpTC83m9Psw==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr1657173wmg.37.1607505473962; 
 Wed, 09 Dec 2020 01:17:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t184sm2310748wmt.13.2020.12.09.01.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:17:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B45451FF7E;
 Wed,  9 Dec 2020 09:17:51 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-5-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 04/32] i386: move kvm accel files into kvm/
Date: Wed, 09 Dec 2020 09:17:47 +0000
In-reply-to: <20201208194839.31305-5-cfontana@suse.de>
Message-ID: <87mtynfidc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


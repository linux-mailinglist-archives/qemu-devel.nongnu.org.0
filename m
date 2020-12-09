Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2B2D4007
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:35:47 +0100 (CET)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwp0-0001vq-P4
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwnS-0001Al-Vf
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:34:12 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwnO-0005x5-KF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:34:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id k10so988036wmi.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=L7sslWqrC1oov/0bd+F+Y3h7ZxNZ02YSaEWzCKDCuNY=;
 b=VUl/XVK4h8rPKW9x0UcXbRpaU60oP4H5pajPrP70E6KTTqSs3niwbKfAjsAmREmvpe
 WIFJp11xc2vx3i3OwIidHCdfzpHgAPLyg04ivOeLs5Q8iSsufLOXkaU8UaB4y1GgH76M
 ERCaWJmg0ZYt8P5yD9vSDmFcxLES8efmRuwrmlP4lBwCybP26GrWGa0P7d3m/z+lErOC
 HMsIsTYP4ecAyFlFVZK3kU9Vn6vNWk+G97G2XIPZcpU9+UthUQ6rZJZIccoRyVNNy0ad
 jsk4GSUwyibyxWIRrNZ/j2J8s09bzpnYQOAfKTMILQ9OLw/1vNkcAp6M2SXb4Y9DVsMy
 Hk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=L7sslWqrC1oov/0bd+F+Y3h7ZxNZ02YSaEWzCKDCuNY=;
 b=KbLOHEuy3UisylxMbwMXA2/Gr2392EVTVRAOIMqYFKc1jeohC9r1cBgz3L6YZP2731
 S0fEHNK83SmzsSw1bwFF/bjt/Cht2vtEN+OwT1hdLTI+DmemhiR4GqwdU0pWVpjsnXa7
 nrCN8mYiLVP7GKQ42P4/W+wKRuYrnBpN2WIvWnChrQGGdLZdh6nkH7PcTDV/OIGPWa6W
 P7Mc/KA/YNECVmQSsEDHnttRUbn9W6WeevaJTyI3K0BycaomV3g1F9j3ji1fGF0cJfIW
 71r1gg56vRqKzvsPO6C6KSqHaX4Tu0/wEiLbq/RMAbvwBvLuUjYsoabctvlZIQ2W8Ujy
 h+NA==
X-Gm-Message-State: AOAM532fJ5MchsX3V+Z8Ut/ETlt7ciuuYtMDsI8l4DSuGg0CC5xivhE5
 G0WnPJsV4KBnK+UwBekNGQbjkA==
X-Google-Smtp-Source: ABdhPJzvSbFYDFXBm58NywU3819/34mcu38IiZZlROkze3oCZ7DvPpcXKj+nketPjgCKGUmTlg1WAA==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr2017855wma.18.1607510045145; 
 Wed, 09 Dec 2020 02:34:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm2645466wrt.35.2020.12.09.02.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:34:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D14731FF7E;
 Wed,  9 Dec 2020 10:34:02 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-12-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 11/32] tcg: cpu_exec_{enter,exit} helpers
Date: Wed, 09 Dec 2020 10:33:57 +0000
In-reply-to: <20201208194839.31305-12-cfontana@suse.de>
Message-ID: <87zh2ne09x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
> Move invocation of CPUClass.cpu_exec_*() to separate helpers,
> to make it easier to refactor that code later.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


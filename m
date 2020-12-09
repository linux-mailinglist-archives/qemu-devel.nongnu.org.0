Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FC2D402C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:44:53 +0100 (CET)
Received: from localhost ([::1]:54524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwxo-0000Xj-W9
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwrb-0003iT-L9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:38:27 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwrZ-0007Xs-9M
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:38:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id d3so997754wmb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U0TWIVHPQ7j4KXnKzm7OBKVxRoFmUdtxX4Qv8HQplTE=;
 b=xQcmDEvTPapG9j8GJowEvoqMBx44hEJIhEaA8Tdsg0wgWNie4ivD8v+8Tsd1ahhzoa
 6DrKUdTQo0U/S6cB7c1H7fBujCseKBVrlVtJYs3h3VEZqobhZ014pyceLT1FyMU43PCI
 YGraouTM+AuxAKA4iE6kDz023G6btxRQP6BaqK76QfyYcvod08pCtHZ40suMRTwQcj+R
 eZaGgbhBj3IDsGBcbx4ADZk1ZnUJDhptPToat+Tr57ozMcAQWTFt/DQeM4jH1VzXaRGi
 z6G4ocPPjpw1jdi8bgMs2pnTnpisf7/CFeKCXt3qV3vaFI2AM/A/VJh087Xiefdw+e4N
 gQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U0TWIVHPQ7j4KXnKzm7OBKVxRoFmUdtxX4Qv8HQplTE=;
 b=EIkqO8KyUHhGdpmNKfuR9iSFA5MjEsMvhP6FV4SaV53Qdi8vpqk448uBKRs3e1y/FE
 zydc5xyXLEM1PvdbkMKx6rBr56HKimEJmxFoNhXTsRGYGCDj99aDZIp2/qj8xo1HpYax
 nIsKfJ13kUWZR4uEPXQivRaBlEs9LadnWfiA8fX0p54biJssRatx2AEwjIshaVXyp7hk
 H4gsLhxCFspz94nzSjml4i/Z3rf1QAfBp71VwouHy8IKeuyTSfmhYLPrJcUPALSn/iRi
 cn32nV68hDTTWmaHBtQsKxvnhf2l1CeB7lvgPobiwFiyGF9CB37nIFfxFaVdlAdscXY/
 k1dw==
X-Gm-Message-State: AOAM5330bM0RUkpnjLJhOc0wlX8sylEoRSIUa1BCKlyPrnX91z2c8w2G
 mP8MCQ1HBN/+y5OxAh7HTvhCEA==
X-Google-Smtp-Source: ABdhPJwH1/IuJnidHOmtpqLrm7hI/wtAFSH1flke0bFyboBVsskx6mVoI+zurUUO5Jc9rbB7Urdb5A==
X-Received: by 2002:a05:600c:21c7:: with SMTP id
 x7mr1979368wmj.75.1607510302741; 
 Wed, 09 Dec 2020 02:38:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q25sm2826328wmq.37.2020.12.09.02.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:38:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5BCC1FF7E;
 Wed,  9 Dec 2020 10:38:20 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-15-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 14/32] cpu: Remove unnecessary noop methods
Date: Wed, 09 Dec 2020 10:38:15 +0000
In-reply-to: <20201208194839.31305-15-cfontana@suse.de>
Message-ID: <87r1nze02r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


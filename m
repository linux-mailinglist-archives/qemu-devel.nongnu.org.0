Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961B2D4149
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:45:50 +0100 (CET)
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxum-00077d-RU
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxsd-0006IO-W1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:43:37 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxsZ-0004tf-73
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:43:35 -0500
Received: by mail-wr1-x430.google.com with SMTP id t4so1377744wrr.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 03:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=XsHdcuwnQW/mLz9rzeShicZXhMy0iFg5SNn0LVyd4YOdUGeYmKwf+SNCkA/rmYNEMh
 3rMk71qxstONt9LRD23rNNUkxJpXj9UqPhIC4lmxbnX92+KGoJHfwQ2h0MQXAxSPwPJw
 x0ELIaJL953NIpWZdEIwnuWKMCl/fz3nb/Jh1TU0QEXZfDFJ2Zo3Dx9+4SaM1AmhQKlK
 W1LM7IgWG+dQ45Rv0qPmTISMEqIEGM+9D/WjT80sRiuxC56CDn8P8BRJ91nAT+Fj9MVf
 ME1UzuKQ1VTTLzcKyAs1fRUmID5nV1bn49GcidtXX+E6aQTFfBufcq5nFzEWvCTl08Q0
 sQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=LQl1aKrlwMMheW8T8TsIxMuZmN3WKVGcQXznGc3hhR470vw6Ee6Kx2U+LzbRhK3vka
 dtIY8xPueEONxuRR1I5kNAZEigLDpPi+MYHCmNwHzyMFlx6SUdNlZqyvFMSOmSqW9rJu
 bT0O7KeMCpFRVQmyPPl357ktlQS1ZuPx/+Br69xZ4sgphQCUt2sYAjxME1LG4pxBhMHa
 ey7v86h9m/QcODBmUh7clbpejyfmKu9ugm+tIiJK/l19iYBmbcREsVEa67VT2qBUmrap
 /CMHnpoExp2fshfhBmaLeg37coIxmezQO17GSX2PQDZVzaPzjc8lEzZy0LCdLFpPlydG
 UiZA==
X-Gm-Message-State: AOAM530llDeo8o7F15WJaoZM+SlIrV/aGFftcvYl8koKGyBnIs1BG7DN
 Rntu7fGN2cl6AzIsiboly0R9fQ==
X-Google-Smtp-Source: ABdhPJwaspVyxtZI1Wi5fh6MWyaHXO18VA2pH1ztIo314MUiBQUOoy6IGmB3JQFeTZrnVzPtHl8J1g==
X-Received: by 2002:adf:d843:: with SMTP id k3mr2272751wrl.346.1607514209406; 
 Wed, 09 Dec 2020 03:43:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 35sm3241550wrf.9.2020.12.09.03.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:43:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62E2A1FF7E;
 Wed,  9 Dec 2020 11:43:27 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-24-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 23/32] cpu: move cc->do_interrupt to tcg_ops
Date: Wed, 09 Dec 2020 11:43:19 +0000
In-reply-to: <20201208194839.31305-24-cfontana@suse.de>
Message-ID: <874kkvdx28.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


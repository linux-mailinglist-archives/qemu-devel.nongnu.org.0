Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C35307E96
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 20:13:46 +0100 (CET)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Cjh-0001iv-Uo
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 14:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5Cfl-00014j-35
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 14:09:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5Cfj-0005uq-Cw
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 14:09:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id c12so6520718wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 11:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4962FaQHWmPPOXrpqxLyQpL2P91jJaV5dmEICmtkPoU=;
 b=K2yeGRCR5yK30s7sGmSbIYewcR3KYAJ6sdtToLnSxl/UdQIQtbB08JnMrO4QbPtxoU
 VnCRfkpzjVHHza4Jryh16v45u8k/aDigImm39UHw+1qCNzPN0hgrss+77Qhvw0nhrbu6
 PxyTM0I9FrWDt8fE4iVOcvLQsDD9Z7JpgGD+fEBXeh8DApGglcq3K4VaiWrTQ5Pu2IIg
 OhhtSRKvXKCqMGHWmRark0Spk7fOQbh7rd0Mh+53LKfraE1D7+aBXRo0OHouosWtlLmE
 ad/w6gVSaPBMx5X90ey3NxXHA9eYr/CgCJy9R/PrYuNoSWTAvEWCz0JQaL5WCsF+UPVn
 IYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4962FaQHWmPPOXrpqxLyQpL2P91jJaV5dmEICmtkPoU=;
 b=VLrZyEoVAVnl2XG4Y+3tRy+NPEInn+93jtutxdjcJZ/SmAeVcbustjeWLYngkOeR4j
 5n/mQkjRCsdlTMB8wWoF9pevhIogWuXltPrXriy64/dpPRAXSWysOPMDlJng13T79iBV
 jAZZoWhOTwSeR7SdGgogE48p263ay64q7OXOD2upOdBEn+pQWLr8VkOaX6qQlPfPPr9g
 Wva75mCYwCvIsDyuNvJsHHK/bY/BXAdkU+QTe4ABeDuo9kUYXRljG5ll8kwJ94QhS3s2
 dF7kQrWZA4rA6xf7CroXlcYiXKK4MsKLNd5r7E76dzYaVItshYPxCjgSD9zoAGymmT7p
 500w==
X-Gm-Message-State: AOAM5336z8pRUfEjiNNQWpZGm/0Y9ZLRErtKoXd47wRn0N0yL4XWuWPi
 n8pvyzfEHK3UGfeFLXIb9xhlCg==
X-Google-Smtp-Source: ABdhPJxuUeb6XF+1P96y0oXQYntYLQMw/LKlP+X2vaCJs7YItRPnbTgzKogoNJFekL7bSNzMNFOTZw==
X-Received: by 2002:a05:6000:1105:: with SMTP id
 z5mr593564wrw.15.1611860977616; 
 Thu, 28 Jan 2021 11:09:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm8061496wrs.71.2021.01.28.11.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 11:09:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3B5A1FF7E;
 Thu, 28 Jan 2021 19:09:35 +0000 (GMT)
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-13-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v14 12/22] physmem: make watchpoint checking code TCG-only
Date: Thu, 28 Jan 2021 19:09:30 +0000
In-reply-to: <20210128092814.8676-13-cfontana@suse.de>
Message-ID: <877dnwubdc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> cpu_check_watchpoint, watchpoint_address_matches are TCG-only.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


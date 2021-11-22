Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B345965D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 22:05:33 +0100 (CET)
Received: from localhost ([::1]:53666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpGVI-0004m5-1V
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 16:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpGTc-000453-HI
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 16:03:48 -0500
Received: from [2a00:1450:4864:20::42a] (port=42732
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpGTa-00028k-UB
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 16:03:48 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c4so35051590wrd.9
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 13:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qjEBJaN7UHfgDKiwnFNO4LQWJoecrqAbFQMppZorW1o=;
 b=dRR672U5w5Kufl8Y3cuHAhIVxKIRk/cSja6shprtCgu5Ohc36AcqJNZhROIxlbZHdC
 WC8kAMKhlyWce0TkvSrMq4hYXZxIETjiqCwy3zDnAlzXAlBrTCJLAdzI98CSxYYg16Et
 EM+urM66ryPQNJFC2qtgebRipA3JWSz0zml9CIs9r654VJuviyVdWwp8zypCTGrAbfxQ
 tec2UUuhl5fU2zql84xNalt0LvBPpU09KfRLOpA1TXeS/QrR6d0BrShmCiJYSy/ChPib
 pOxnuQ+3lum9toVDld0t2ov+bKLlJP8eI3BLJUE47wPaqTipNAjFQMnEstM/RYMC8pLt
 4RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qjEBJaN7UHfgDKiwnFNO4LQWJoecrqAbFQMppZorW1o=;
 b=FXKFbgI5Ltuk+yk5MUW7Ah5sH087nIsbSkrLf8Fnldi3TlmQukH//HBRMh25dEXIZ1
 ebAnXdGUwQ3pqsE8q7E2MkGY1NgQe9K9V9gQIOhT7+5nT0kPCq09dlTOncgnSujZBgVA
 6L/0QY/NIKmI3Lps2oRvQXcQ7i78R1zlWDFVsU6eOAph/aMg/DgoJktqVFHAhT4Z756P
 dszqVikWkqTBToIsARHpzapao/PHb0lODumBhiTCeza/NRCj4ESuvAEE9RAnlwhY9vpu
 yq1/YeeKTLvXi41tJIieAjFYgeRSFvijEP4GpDPuFl6tYFW9uZNV6jRYA+lhRajF+rD5
 yjiw==
X-Gm-Message-State: AOAM5334psCYGBzhW5YjLHw8Ul7q2vVMkOQRTx4tOOfc7kT4mlyBy1w7
 401+W/A7nBQgW667XF1FvfczgQ==
X-Google-Smtp-Source: ABdhPJyUNWICEviy9juRree1XcGmPsMndlurzhMcP8mtsswPKWEBsyLtWIWuClJE0/tQiWRRNlDDBg==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr170990wrn.247.1637615024686; 
 Mon, 22 Nov 2021 13:03:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm10080634wrp.34.2021.11.22.13.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 13:03:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E6361FF96;
 Mon, 22 Nov 2021 21:03:42 +0000 (GMT)
References: <20211122191124.31620-1-willianr@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Date: Mon, 22 Nov 2021 21:03:29 +0000
In-reply-to: <20211122191124.31620-1-willianr@redhat.com>
Message-ID: <87o86bgaxd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Willian Rampazzo <willianr@redhat.com> writes:

> Remove me as a reviewer for the Build and test automation and the
> Integration Testing with the Avocado Framework and add Beraldo
> Leal.

Queued to for-6.2/tcg-gdb-plugin-fixes, thanks.

--=20
Alex Benn=C3=A9e


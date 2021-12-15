Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC392475B74
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:10:56 +0100 (CET)
Received: from localhost ([::1]:43776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVvi-00032L-Jz
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVFN-0007Tc-GD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:27:10 -0500
Received: from [2a00:1450:4864:20::42b] (port=34382
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVFK-0002Y9-K9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:27:08 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s1so4389500wrg.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=tvyZrNRDUNAIY6BRG7LMpfz8EzZN25/FDPpA+Ah/dBw62ldXUDvExJKexlytrUiWjj
 +ovZYD27hcl+ZqeFEaex6kGUzUCHQ/428bI4Y0/5eOvrhb65ZeS6JbwLo9ViXNXbr7/A
 0tHHU1k3Lukx2vA/mZ9cxloaH6f2S1IsDquH96Lj3AJtARCQMQDkh0Jb7KD+W1YSYMOg
 OEj8NKcoSYMkeK1pg9Jjr3Czl6bH1XHgQsrWgpjOs/9IbL9h7pClI2VEqJERYwG79id9
 cejgH4ex2OQyl934tQM9ttibwivlg0KQRHsuMEs9FbelHHVRt/1sDhNLRd3UbweVaYUT
 SLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Oil9VzGtKBJ8yyRinRuy6lB22ecb4YKbS26/DY7YSNc=;
 b=Y8H1jqjpiwxxqPHVsNk2VozyB5GDaMP5DBaCoAu3MoHQLglEEyR7B54V0r1PXcivyI
 rTXtpMvzY+FB3Ny6VEScxiN5UoVzaBYKmJgzv3Ri0i6UoTeApERq5FejtuaLmU6XgafG
 CykPJHcMYxni/EQcK7aOkjM20FTN/WOHAJvhq3moHlfbEOw3G11YMs56+L/IdXuzjU2O
 5vre9/raQ6Y3NnOT+FlezP3aXoLK4KcPxITChWxEJigC7mmiALoRX51NfQ2PYv67zQet
 okQLVqKW0ee8eFKuI2BbNd7Zp1yojW7wNYTRBCzG4QtpsdS27QX2D4Uu1EJx1PDzV1Ib
 1anw==
X-Gm-Message-State: AOAM530S1MoBG5LUsTKuXCXHf6au0660an08wfkLUlCVnYWoetDgM5iE
 2lrs2PcpMJ+CvnYU00i4pIzbnw==
X-Google-Smtp-Source: ABdhPJwk8wn34z0yGgAj5FmbwcLR5bqrzujiBFnWuEGTD5AOX5k2g5/PITYZcf58s6c9xOwwt+ehFQ==
X-Received: by 2002:adf:eb06:: with SMTP id s6mr4769717wrn.96.1639578425256;
 Wed, 15 Dec 2021 06:27:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm6520329wmq.18.2021.12.15.06.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:27:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6BED1FF96;
 Wed, 15 Dec 2021 14:27:03 +0000 (GMT)
References: <20211118145716.4116731-1-philmd@redhat.com>
 <20211118145716.4116731-3-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? v2 2/5] docs/devel/style: Improve Error**
 functions rST rendering
Date: Wed, 15 Dec 2021 14:26:59 +0000
In-reply-to: <20211118145716.4116731-3-philmd@redhat.com>
Message-ID: <87zgp2eyfc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


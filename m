Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4DA365707
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:02:56 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo9f-0007zN-ME
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYo4D-0004bc-Mx
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:57:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYo4A-0007De-Hh
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:57:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id y204so18482280wmg.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=PHCjlAE2p3S2cE6bNjTJ4Na62QR1GL7XMW5YmO7Oqgv7FF+Ms95tblo5q1HBgPrBpO
 XDmn4iwhgWeiOQLfO88hLt1qVdK5Tpx9qjirO7SHNCChOoe8zPbgxtagbIVnFrUa7nT5
 YTppMifQtRG2M5EbuYDdy67/Dxn0aM27Et5K8TqiUGR1kmRgrOy91C5ACv5RbACid31m
 NaDS6fiEZTfhP7VcSZT/iuN1McdLp6nrYPm2dEBh3t0JDLtnxaoCr8ovxi+FraCHxtPH
 DiXcER4T5KlVMr2uthj2NN2BYj7qm7Eer1LKhZG9iGrxAI6aajtwQuJdkFzkq0dsTphP
 vlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=WztB3F8Gdsb6je9A5RbDV7qPG8S36KhdFIXj78tmkYs3l7ZCH7aS3cw8Q9Ri7Gevc3
 eo2gxLjJW/OqX3vMzHsAUwg4I4RA62dmgXG1BpFDESfY884zs6Z0PNNksDzBnr641QUf
 npwQZIjrZpf7GAVRmlGixPz/IHk4SpmpFIC3wAVTY9NQDx2gQIetqASsjpK89mwGJnv8
 eyXq6ENFuayw0nLH1xT4hJXTAncBH2sDn/fauWWY39puepcTY6zjPMR9KXvs92Tm5Rxn
 jdZDOnGoMHrICbbSoNcDYXl5RBA5kGJcbN5LzSarnCisDvbc94Yxh74CgFpG5xYulTa+
 Es/A==
X-Gm-Message-State: AOAM533bHEoiSySZTTsrt9t/ZKJRo/Hjrv2KjB6yLdvQOk12IaI/UyOe
 lZAepGOMHQbFKpH2449XtQk4fA==
X-Google-Smtp-Source: ABdhPJxg4K276dx1zslppmCN1P5KZk4BNhWzN0JRZy0y4edCEo8CZW3CfcGyn2S0EsGbfammI62pZA==
X-Received: by 2002:a1c:e407:: with SMTP id b7mr3749428wmh.75.1618916233021;
 Tue, 20 Apr 2021 03:57:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f25sm26695587wrd.43.2021.04.20.03.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:57:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D82701FF7E;
 Tue, 20 Apr 2021 11:57:11 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-16-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 15/80] target/arm: move cpu definitions to common cpu
 module
Date: Tue, 20 Apr 2021 11:57:05 +0100
In-reply-to: <20210416162824.25131-16-cfontana@suse.de>
Message-ID: <87h7k18bqw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


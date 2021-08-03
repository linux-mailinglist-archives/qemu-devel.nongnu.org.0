Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0A3DF6BC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 23:11:35 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1hG-0007bb-Qz
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 17:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mB1gW-0006ud-QS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:10:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mB1gV-000452-9J
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:10:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id j2so26644214wrx.9
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yCcSN7acP7cJrnE6FfFIUfcyU4cT7V062F+NhUfoaLc=;
 b=GyadiYfLOkja2uEY4SMIF5seW10Jac/IPYz/k7V2I+f0zSDWfPrwkReXyjh8WmczM8
 ymOWSfbbCNmRi20XOyB57FQwJ7gg/y1Q0y0t8RZb39q9T1Yig0mBLqfC/dSDpGPBDr08
 ZJ+agQAEA18SI3EoKUEpW5L2hGdUyfP2GBCcVTmJ16e3y26t6bRbx5YO2bwypd0R1UP2
 FC2PxmW0ESnUyxUwcOV0425/j7uY0RFidid87RrUKg+FeXc9ZozORQPCrYjJZ4vHt+Mg
 zGkGL3poma8CV5KrWE+t52uiYzoCgYs3n6ACEkQQnJoxiYlbhU5nnaFrcIXSuIiTx8U1
 TeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yCcSN7acP7cJrnE6FfFIUfcyU4cT7V062F+NhUfoaLc=;
 b=JVRVb2Xw0gTauVvo5cdNx3inyBVmLM5TyFKmUPBlVZ1RUxRZ4iHo1yeA4regN/w1Be
 B6+8XU30d9uAOAfZfZnOwOfWUfpXzy0LnmBDKbEIBYlLW19DTNLgUXvb2iTkhAZYxogy
 GN/Z//ahHMvmk0kuuTU3jfr6h9RKpOxGZIjaZ4ilP+EVP+y6GKte3cvALStQYuzMmhOG
 Abop549E9A9s7z15/hGFmIRDTAWAJhOdO44h5kI9wN7Y1Kd35bw//HwMeaW07uMktQao
 ZVck+vK9rMMDqTVejGEe1hwoASe1t/LjOZ2kFrlnQg8EehFkg+Vn8aw00Wx++FnDM1OP
 7UVw==
X-Gm-Message-State: AOAM530TdIqZhti4XmzKnH6R16k3hTM7j22Fv4tfVDYOAxE9JE9kymee
 6Bv6aaGRpIP+XvV1Fcg9oWiIzA==
X-Google-Smtp-Source: ABdhPJxtH00I9cKxkXRz3kWjHDFDb6esw2tAcrhRK5ymQDEsCr+zGNbNUUCEl1as6jYGLTXmeaip0Q==
X-Received: by 2002:a05:6000:227:: with SMTP id
 l7mr24064169wrz.289.1628025045427; 
 Tue, 03 Aug 2021 14:10:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f15sm80074wrp.12.2021.08.03.14.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:10:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11DAC1FF96;
 Tue,  3 Aug 2021 22:10:44 +0100 (BST)
References: <20210803151301.123581-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v5 0/2] plugins/cache: multicore cache modelling
Date: Tue, 03 Aug 2021 22:10:38 +0100
In-reply-to: <20210803151301.123581-1-ma.mandourr@gmail.com>
Message-ID: <87fsvqfd4b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Hello,
>
> This series introduce multicore cache modelling in contrib/plugins/cache.c
>
> Multi-core cache modelling is handled such that for full-system
> emulation, a private L1 cache is maintained to each core available to
> the system. For multi-threaded userspace emulation, a static number of
> cores is maintained for the overall system, and every memory access go
> through one of these, even if the number of fired threads is more than
> that number.

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e


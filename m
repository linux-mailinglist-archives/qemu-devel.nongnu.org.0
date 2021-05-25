Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A840538FFBF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:07:46 +0200 (CEST)
Received: from localhost ([::1]:56908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUuX-0008F7-Ob
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUsa-00057H-JY
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:05:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUsY-0007UH-W3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:05:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id q5so31728406wrs.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qmKaq+uGHaFwqSo1/hENw9DuFjsvc6MqR9b2nBIV60c=;
 b=bkWp9bTAxF+0pIZJo0enPWYhAkoIyek/H6Qp34bwwPCVEd9QuHDbTeSIUJ65/FDFyH
 U8HZ4DQ9EC0mZM8yemkyQhM2frtz4D9zcCKaOyK4NmhdNn4nw4mFrjrBZw/w1ETX98Qr
 YF7r2K7wcxdG0BlULiQgUC9bJrJO81uNXK6uiZ1aWqpPVsp5V8jTgUllGNySzSuqS8rE
 vbSwXXLT34X/p3Mri3FlxGTmwlhbY8zsH/YrlZ26F+u+SSFYt8uZeyTHTCobVjjPvE8R
 pZc6Is4Tq7vs98DOYMI2y3NbRIgxPrpbJIjzQb/KQELyIModXsoD+RVwkLXWo3raFs1i
 0j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qmKaq+uGHaFwqSo1/hENw9DuFjsvc6MqR9b2nBIV60c=;
 b=ZlyGB9DycQeRC4EHqNkSdUg/1xydO0/ZszcnIydTy8Tw26gjQlhSyWFrnMhpvJ/Nw0
 z/2HSZ2v/12hAS9wDTaWOoipFw+pB8e3puq7GjvHFEIs6UyNnH/+YRRnXuqKP9Yufoqc
 5GvNUcPvj2EX619vbTTw3988ZWkMkzGVFSeYP5Dzg00BuPsOwo0akEMxUNloU3v4V4ZR
 PpD3uYvLAqTcT13I6qD88aAxo4qoYtLlAlrTX5Xqp8dbzcz6p29ktxv6vEV2XH11iGoF
 pQXfaFRAzztaZngajjCjti7VOznBP1PwH40fPjo69dGuvqRC0XGiNrVXNeLmnhBMRPQW
 tmQA==
X-Gm-Message-State: AOAM5331LocG1CE02ytnyh2G+hGU5JzmdpNodvhI/RcwU3OhmvHUhann
 3QVhWJmvgzAIbW2hhN7MY9VdpQ==
X-Google-Smtp-Source: ABdhPJx+WagCy/bu43sw7dnJFJrxL609yJOoNXjhwE7vo3guZnzdZ0W2drJ1KVN73loO9/RvqJWksg==
X-Received: by 2002:a5d:4b08:: with SMTP id v8mr27124542wrq.122.1621940741645; 
 Tue, 25 May 2021 04:05:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f188sm2226659wmf.24.2021.05.25.04.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:05:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF1C41FF7E;
 Tue, 25 May 2021 12:05:39 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-3-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/9] gitlab-ci: Move current job set to qemu-project.yml
Date: Tue, 25 May 2021 12:05:35 +0100
In-reply-to: <20210525082556.4011380-3-f4bug@amsat.org>
Message-ID: <874ker3wfw.fsf@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> To allow forks to easily decide which jobs they want to run,
> but without disrupting the current default, move the current
> set of jobs to a new file corresponding to the jobs run by
> the mainstream project CI:
> https://gitlab.com/qemu-project/qemu/-/pipelines
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


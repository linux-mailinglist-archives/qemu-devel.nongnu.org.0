Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049F341EE5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:58:57 +0100 (CET)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFeS-0006xh-LP
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNFcK-0005PH-U0
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:56:44 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNFcJ-0003oD-9J
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:56:44 -0400
Received: by mail-ed1-x535.google.com with SMTP id l18so2666804edc.9
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=afdYsiptNua+wlGTimsyXroVNqoa8d9SWnqMGNR0qwU=;
 b=pH7ILzxS9Y5uVaaj3jFyOjVk5b+ChmrJ0Dh0qXtorcSeHqzxM8kvv/mUMMQ9/W0mC0
 v6D6EyhHRoiJF/OGJDz79s1TBG8ULdg8vKxPOcarRcHvQuUfOH0iaOtYhWTufXgwX3Mg
 RKE34mhRiIyoqO1BnzkuEOPtlwDQxT7bOJDbOLQxONeG/RpdC5tHWuCQk6kv3CXyqFbc
 EFGSjuf1g1EIbMbSlF13Hm/QfxySDACerPDC/SWpkFcoXUbJIkL/7XKr0rRPi0ofv4VY
 5n5Mv3W63MZ+Z6TBMung2eYx45kNV2auqBp+D/BLWvQdZFNPk+C7Iq0FJN9Kz2BbnRVJ
 B/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=afdYsiptNua+wlGTimsyXroVNqoa8d9SWnqMGNR0qwU=;
 b=UXhESWTHkc+93crLbzT/nGJTIzTuGawfYbTUnX6IQTIqNlvsWCzg64WVabXW1Mfpv7
 cdJ/0n5STlG+ykgcRQ+aJh7haBJfVtCoVvYb6wSV8jaj3IC0PfwrmUJiEyQejdICdDtf
 YXzjx+LH8zbnKAKEwW3bEM3qwcT45/29Jvizja+R9ImRJhLJl/I5JKeMOlB3HZBn6vs2
 tDDBw6JiVd/FP3+Z0fHd+pJr1KJj1irpU+GclTIU9RBJ44oeAz3JIE/+VeWx7vtx38rv
 i8H1gjtODdod6pG/EfTa5azXFx8IOjNPGWTajBVzxr7J+cCbakLscf7ahQgtYZDeHiYC
 uxmA==
X-Gm-Message-State: AOAM5318QMzeHmW/BVJZHrR5f9fOyfUynDb8LYrlzc4BOQAB1FAXK41r
 T/IuURVh48GaaeSMfOTzRR36Dw==
X-Google-Smtp-Source: ABdhPJysQA08ATCVquMj20Li2ynT/IqXIt/kXLb1TKx2a7AP1VVim0cxrcIWNHiBRcz6K5+bqKyCSg==
X-Received: by 2002:a05:6402:b48:: with SMTP id
 bx8mr10034040edb.162.1616162201110; 
 Fri, 19 Mar 2021 06:56:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b22sm3899022edv.96.2021.03.19.06.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:56:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 733A11FF7E;
 Fri, 19 Mar 2021 13:56:39 +0000 (GMT)
References: <20210319095726.45965-1-thuth@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Merge the trace-backend testing into
 other jobs
Date: Fri, 19 Mar 2021 13:56:33 +0000
In-reply-to: <20210319095726.45965-1-thuth@redhat.com>
Message-ID: <87k0q39rhk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Our gitlab-ci got quite slow in the past weeks, due to the immense amount
> of jobs that we have, so we should try to reduce the number of jobs.
> There is no real good reason for having separate jobs just to test the
> trace backends, we can do this just fine in other jobs, too.

Queued to for-6.0/fixes-for-rc1, thanks.

--=20
Alex Benn=C3=A9e


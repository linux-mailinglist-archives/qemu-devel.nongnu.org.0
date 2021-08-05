Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5F3E147D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:12:40 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcEp-0001t4-D5
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcDB-000072-L9
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:10:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcDA-0002Rj-3d
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:10:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id k4so6281759wrc.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=l8S7IMdc4SUhiw5I4pOV8PMvaReZnbbuWwyyj8foNcE=;
 b=rg7Qf2QIh34p2094JO5YA1CnII1ub6fHhPWuq9JNtrYCMcD7/DBVRR3U1wABmgZGVj
 /WjPa/CQt7sdr8O63URlwPpw+SYEFnozNLDdo3pbziA+R2Ixu1zamt1E2qE8LwzaboQV
 6zqRNoWM04zuCjftfbjsYSm5MLrr9kJlkMYu+bI/dVsiwiGweBwslcofR35UYAl6TYaq
 li1ZUlE2XkA/tXyE9f1ErbQQ0awfsDc/utdHASkGg+3F1Ta4u90ZSkLSxiPN4iU2QUWX
 MCxs+D1ps2iIJvSPBNqcGP3e2fewnW8yM1yI9vwHusAoBneOzSWo4cDv3o0DgxY/22x3
 cbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=l8S7IMdc4SUhiw5I4pOV8PMvaReZnbbuWwyyj8foNcE=;
 b=sM47FqfI4BYTF08ggtClUb2Xpl1+9tCqV+AioQ/qG822juESz1TcbbFBS1RNMCbcO6
 aS5PMGL4ZIGClUW90ktEu0DuISrN5ZTaigTj+SD3a2wxgvaZ/O4pzdIqTBa0F+gl1Nmu
 mF/3NQBwBOK0kSbboxtsvckUalKc9kmQM26+KBAAlWiiJZ5403Q6YZMuPmddEG9AZUyw
 ARG91PP12quyJapkpgS1L8482RiaoLkPSjf04u3X4gEhTgYMWDiobTaq+s0KKqvdkxst
 LAau0FEHEZyhx+NZEk44cnHH8XE5QQV1SvLCG3HxCnM9tUoXojtrzBPAnYUDLUjNgOo/
 Z4kw==
X-Gm-Message-State: AOAM530jca2wQ7Pfo8U18KTX+/kTnoaFxzdwpXyYUbyjmf9jK50c/BZL
 asv0+tYJnPTiqMjVrJl4E39TlA==
X-Google-Smtp-Source: ABdhPJwISgSjut+vLfk0mqHTBhK9o4zKXtkWt6DZQf5/vfCAWtGcEk5AONGlY5blfA+FE208uyVVqw==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr4995433wrw.72.1628165454581;
 Thu, 05 Aug 2021 05:10:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f26sm6063448wrd.41.2021.08.05.05.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:10:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D11851FF96;
 Thu,  5 Aug 2021 13:10:51 +0100 (BST)
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-6-jsnow@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 5/6] docs/devel: create "Subsystem APIs" subsection
Date: Thu, 05 Aug 2021 13:10:47 +0100
In-reply-to: <20210804005621.1577302-6-jsnow@redhat.com>
Message-ID: <87a6lwks6s.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA543BBE3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:54:50 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTT7-0003tb-Oo
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTOQ-0006Uc-7W
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTOO-00049i-OE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABawOY87v7g8wzbL5+rUQF79ptbukTSGqqjjIz2Wl9w=;
 b=dKbxR2JzarwbznPrcohzEJGx4NrV2yGf6Us458oPBIEtbxODFwJr6tdf6KdvET52banoVV
 VZlh4WvPhbFoz6SXmTmy0IFUm4PaD2myHbfgUpFnUbMUFOhFHOIRWZz4hhRQP4u/GeZF3u
 Q+jm3oRCGCVGzlGWgPsBy7S4cNUY0js=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-NWC5k1cGPl68IsL3IgntqQ-1; Tue, 26 Oct 2021 16:49:54 -0400
X-MC-Unique: NWC5k1cGPl68IsL3IgntqQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 g11-20020a17090adb0b00b001a2d5d19382so16370pjv.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ABawOY87v7g8wzbL5+rUQF79ptbukTSGqqjjIz2Wl9w=;
 b=lBZMjv+zkRebuk/uGmYAKt2oQr1ociquASXu7QIJjzBqVm8n6yj3svaba3E/LS3qbY
 rixdSRmwZgH/ugpXJW7u/eIV5Bbbp9FY7qYG5NvGfsc2EUCoIlFi872YO1XCG8TH1v4k
 N1+qUtBgsO6QV8y+MBYX9dBJAMj1BucdantjlCMnyNeBHLt5dnruJUcLbWUve0AUTCTb
 6vd1+DwQ27snYQw+J+fSYlEp6rENLPDvQi/XAQQ744+iqqgpl/XhKP+Ucwz0ClX7Thyl
 E7lWrZmJ9YDvfKQmti1Zf+Nc7zTg2Ti58TjzKMhYCW096dh0FnnLVw98NJValJ/4Acwb
 QbbA==
X-Gm-Message-State: AOAM530PQ3QLsNUZjS+cks+7EIPsazsalnCRD76PPzQrOHsehHgkDH+h
 D7z/4pOSyDEgjau8vbAstbgQAHsvH7ayDomDW115VmFUZxA6491i+WF7emrQOcAO1wSLzgr2M/F
 pQsCnWyPyjmp9lm+8LaxMBnzKK+bkC9k=
X-Received: by 2002:a17:90a:644d:: with SMTP id
 y13mr1262535pjm.10.1635281393699; 
 Tue, 26 Oct 2021 13:49:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpw5LcWrdxgqZ+RWy5mfeKHfrYcsNdjbdJ9zHacrLKcO8V8L5f2pLMpqonUKepZv1FsbIBkmyT9ZbBcpBcbCc=
X-Received: by 2002:a17:90a:644d:: with SMTP id
 y13mr1262503pjm.10.1635281393516; 
 Tue, 26 Oct 2021 13:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-6-alex.bennee@linaro.org>
In-Reply-To: <20211026102234.3961636-6-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 26 Oct 2021 17:49:27 -0300
Message-ID: <CAKJDGDYAQP2MWxCwzN5XwAJObSp1DJB_=dT5Sun_qL02-x-goA@mail.gmail.com>
Subject: Re: [PATCH v1 05/28] tests/docker: Add debian-nios2-cross image
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 Daniel Berrange <berrange@redhat.com>, kuhn.chenqun@huawei.com,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 7:22 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Build the entire cross tool chain from source.
> For this reason, default to caching.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [AJB: honour NOUSER in cached fetch and build, update MAINTAINERS]
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-6-richard.henderson@linaro.org>
> ---
>  MAINTAINERS                                   |  1 +
>  tests/docker/Makefile.include                 | 25 ++++++
>  .../debian-nios2-cross.d/build-toolchain.sh   | 87 +++++++++++++++++++
>  .../dockerfiles/debian-toolchain.docker       | 36 ++++++++
>  4 files changed, 149 insertions(+)
>  create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-t=
oolchain.sh
>  create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>



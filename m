Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0C1D78E4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 14:45:58 +0200 (CEST)
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaf9Z-0003y4-8V
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 08:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jaf8d-000347-FS
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:44:59 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jaf8c-00054b-Lv
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:44:59 -0400
Received: by mail-wm1-x342.google.com with SMTP id m12so9161666wmc.0
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=NeqCErBxflLyXiigJTS73UzHkoXp6KsKWDrdC3FDC5U=;
 b=vGovHqBltanz6zqaPrx0VIT+Bw8n7YMx6t63wbxgxW4cMOWzr8epaHL1F6a8UlK59B
 56FkPmpSMWwYvej8myA+5YbapfFLSZeRoq6wE50NH8YTkqSMRlHEhtniZH/dyhQkhGaP
 35XMuV2+yItcxMB847WUIMr4v+Hi7fAeKwyJg//Gsw9w9YcGl1M61ZtpnO8rzcf1tvQf
 +QdEhUvz9mNYHMJmgRprDFCHfUlfwf2O2jc3wGsON8h5LRACO7hcUt7KiEcciydvu3aC
 y+g0RwuxaCGnaNzwAVvbFIQauEvaA1NhFvDGAKCmelfxEMWk2hPYwAeOZqhKxoqEF8kz
 whGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=NeqCErBxflLyXiigJTS73UzHkoXp6KsKWDrdC3FDC5U=;
 b=t+Yga7Tep5lVWdA3J9sBkwUe72VsnDTrY2QeqEmYRDhEVJN5OWJl9nC5edVlHwUELr
 oQdv0aEYgowwPJW4Bv+IaBEfjoxxQrk657C74snu7pMFLtuCuBYQxc4p2GmcOwrSkjev
 oL9Z9C5MfNIVWtWkYHTyyFD3SjfmwcN5ctytgttWIffYr3jNeTXhRGfV3cuB59wB91Lh
 x9nJidtDyyYxiriPIXKih2PtaTYXV+HbsLh/SMHOkwp0ZQ8xwGqA525JVSRPyHcVoI1X
 /Jsuej9wehWWwZ/B/lACJBbEe+wrANPVYraNkn5nYAT+Cd3aMKXzxYYx74f3ViXFYFk3
 3JVg==
X-Gm-Message-State: AOAM530Fm1kjoFGte521Yo3GsauqHTrQ41z6gcYkLlhuRARRrg7ommKX
 jSJ7o5cuOyAqjqFuGq0mN2ozjxp+SMs=
X-Google-Smtp-Source: ABdhPJwNQJeaRNT3f3kgjfbg0Gr/hRLkoPMu8g8HXHXBhuMWA02Px34Iu8IFWKgIq7z46uh/N1XcaA==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr19958561wmk.92.1589805896249; 
 Mon, 18 May 2020 05:44:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f128sm17281886wme.1.2020.05.18.05.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 05:44:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58F331FF7E;
 Mon, 18 May 2020 13:44:54 +0100 (BST)
References: <20200518083316.25065-1-thuth@redhat.com>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis.yml: Use clang++ in the Clang tests
In-reply-to: <20200518083316.25065-1-thuth@redhat.com>
Date: Mon, 18 May 2020 13:44:54 +0100
Message-ID: <874ksdl8e1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Our configure script does not look for clang++ automatically, so we
> should use --cxx=3Dclang++ to make sure that we test our C++ code with
> Clang, too. And while we're at it, also use --host-cc=3Dclang here
> to avoid that we use the normal "cc" as host C compiler.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e


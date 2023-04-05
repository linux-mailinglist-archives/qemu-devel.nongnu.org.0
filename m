Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640B6D802F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:59:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4bV-0001Oa-FL; Wed, 05 Apr 2023 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk4bS-0001O8-VB
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:59:14 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk4bR-0008La-6M
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:59:14 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-93e2e037121so56062966b.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680706751;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9TrVMCT1KS67l96PNeMioBCa99ES582C1a7qm6eLQ8I=;
 b=DguYc2FAvrXNV8gElRP84U+aHtXH4+XSKiEH8vNHLFIt3iMpSEMGzPiz6QlDPp0h28
 75Vf61cC+eMvcqrgGAnv/FbjD2dkh6L5f83jYXtV5uaBBdNFKTNakkKWG9NL8uj7USC0
 XTOi0htctH0O2rclcuShEzgyPcJMdehxYYAS3rtEA3gZaWwoBFq9FG43onmSG1scR9EK
 +/WcQm8fPcKvmXel9176X2weem5gfu9oo9GO3hM78ZEjQGCBezQ78kD316qSixx72yNr
 +poNdpH3uzR+YZL9/Bs5GREqtc7TMDIX11QVTByX5nX48FO3WQTaxv8iLGvKJ/emxPmF
 RJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706751;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9TrVMCT1KS67l96PNeMioBCa99ES582C1a7qm6eLQ8I=;
 b=QUSIjB1QXenKO9PrC1ulrXUF6aaqgtdYpOmAo6Z0H5Ljur765zf4PvxTaGSSc4qTYF
 K1W3C4FU5Hik5dP1aCe5W7GUd5E7hybJSNk7uuj5nl8iwl7lJjg6F1bDWVHVViMwT39w
 dnWjuAsP+oBol9j2gFSG9AhGkqejhuke95tzgF1P+pPBNAd9sDTKnnmOs2/KDWsE8OMa
 KL4HPVrdUAyOnU4/eP8e8IydxIqgsM+Jvrt3fUWm4nDFGaziYgexom6lAUKddSeDhVlJ
 zpAFQwly3BD9ClotaFkwjDgh0tJvUKWaqAViO3fmUwG8wNGLBE8Gi9xdhNClnUYApd8x
 Dk6Q==
X-Gm-Message-State: AAQBX9eAXUsfU7uupG7WcjVw67aMdOr2opDuae03iAKQF4bEcuyyMF1s
 PnkI4qtxQCnHRxLDdm1wlbvTVE5bVq0Ub3l6AMxh+w==
X-Google-Smtp-Source: AKy350aRbyeUUxlbHUAuluxS3mLbUZnuJRFuar6hlpUZ2aA/s0BPqe1A7qtj18RD/VPSxtRkVRtG574Qw71mZ+9aHnM=
X-Received: by 2002:a50:a44f:0:b0:4fc:532e:215d with SMTP id
 v15-20020a50a44f000000b004fc532e215dmr1365711edb.6.1680706751207; Wed, 05 Apr
 2023 07:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
 <875yabzsmc.fsf@pond.sub.org>
 <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
 <ZC2MGswxJiBfhPR2@work-vm>
In-Reply-To: <ZC2MGswxJiBfhPR2@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 15:59:00 +0100
Message-ID: <CAFEAcA8za098K5wTLmr4ar+dT-wFzN+XCg3fjxPXn5qEA+U7iQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, libvir-list@redhat.com, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 dave@treblig.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 5 Apr 2023 at 15:56, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > I think on balance I would go for:
> >  * remove (ie deprecate-and-drop) 'singlestep' from the QMP struct,
> >    rather than merely renaming it
> >  * if anybody comes along and says they want to do this via QMP,
> >    implement Paolo's idea of putting the accelerator object
> >    somewhere they can get at it and use qom-get/qom-set on it
> >    [My guess is this is very unlikely: nobody's complained so
> >    far that QMP doesn't permit setting 'singlestep'; and
> >    wanting read without write seems even more marginal.]
> >  * keep the HMP commands, but have both read and write directly
> >    talk to the accel object. I favour splitting the 'read'
> >    part out into its own 'info one-insn-per-tb', for consistency
> >    (then 'info status' matches the QMP query-status)
>
> If it's pretty obscure, then the qom-set/get is fine; as long
> as there is a way to do it, then just make sure in the commit
> message you say what the replacement command is

The point is that there isn't a replacement way to do it
*right now*, but that we have a sketch of how we'd do it if
anybody showed up and really cared about it. I think the chances
of that happening are quite close to zero, so I don't
want to do the work to actually implement the mechanism
on spec...

-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858267CE01
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3CT-0002OO-2O; Thu, 26 Jan 2023 09:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL3CQ-0002O1-RQ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:25:59 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL3CP-0002Aw-7i
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:25:58 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5063029246dso24873157b3.6
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+x7jfDMZ+jOMPA4ZtUo7ZFn/ou51kBaSGS04ndojUM8=;
 b=CAF1Foy+mWkbWdi/Ynn5r9lqMXlc3l+4VV4hFo3ziL6hxHmO8A0fxQ0tcgMl2Z8fET
 4fPERAsQzi/tqOpqyIVoDR/YS+uo8aizyCTU293qVgEtGaANprIcaFZFOMf0+2ji2hNF
 IypHvaO4nx1kO3FKbE17RdI+yf+RTML4xHuQ1e5JWvcLKTR7CBON0eQZr210BJudVPAh
 7ZzXveVduBPC+a9RMSNttr306a0z4Bxo9/WpC8x7qzeBe3wAvo4/WPYzc+9wfXiNizSn
 Q+l1yDknUWFQGSZAA/pWPBSIi9lLWTUv2JOK3yirRiHwLWXqIOEb4stMumBW1UWveAot
 9wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+x7jfDMZ+jOMPA4ZtUo7ZFn/ou51kBaSGS04ndojUM8=;
 b=0+Ap/z6mTrFNQmuFiQf40VuCdpr3cXZ7OIndQKf8tXMHheYIy9xOR709/clIUw6XMl
 Fm2Njz3zyJFve8UOqzohBzQ0iL8Q9BlvLwHGwC+Xp9HrOGA9EeczpIT3httQ6KpQkgiy
 LgR/0L80TJz0g2oLk8NdLhaHJu+esvDpo0CIVr4ZIY2ZufkyyJSEr0CYXjh39znxBZ6I
 6MfnuWyw6cb9ALVzfBtPjhhvc/IJ6vBFKq8SW5RZ0M3wS9BpI3CfsSNWGg6Z053Qp/oV
 MCJSvUBrPxH+mUYDOeS6+U6uOimViz0PteASVHAOwCEsnnWjACmFJhcql5vqNWCx5z2W
 gv7A==
X-Gm-Message-State: AFqh2kpMSR629+NXjZe9rt1cWtYY5e9GfSxN2sOYS4CEWSfAT7O0yc/N
 7M+kSEaxSIYhBFTWgDxQHwCTiH/RFzUdGFcJ2Rs=
X-Google-Smtp-Source: AMrXdXugYSBX2xV1UpjRRYq4HyfSGRTAbd+TBt7+flsBuVVRd/+zD6z+mluR9iENwQI+bHl2MDswXMDWQg9d9WnBwxU=
X-Received: by 2002:a81:9a8e:0:b0:476:b2b8:1c5f with SMTP id
 r136-20020a819a8e000000b00476b2b81c5fmr3857601ywg.62.1674743155928; Thu, 26
 Jan 2023 06:25:55 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
In-Reply-To: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 26 Jan 2023 09:25:44 -0500
Message-ID: <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Are you batching pull requests? I used that approach last release
cycle. CI takes so long to run that I didn't want to run it for every
pull request. Batching worked well overall.

You could try the apply-pullreq --apply-many option in the modified
script I sent in <Y5nom0ji4S/CmvZL@fedora> on Wed, 14 Dec 2022.

The workflow was:
1. Apply multiple requests on the staging branch locally.
2. Push staging to GitLab when you're ready to run CI.
3. When there is a failure, drop the pull request most likely
responsible for the failure and run CI again with the remaining pull
requests.

Stefan


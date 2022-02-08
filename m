Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946984AE1E4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:07:09 +0100 (CET)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVpU-00043l-Da
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHVeq-0000Ka-53
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:56:13 -0500
Received: from [2a00:1450:4864:20::332] (port=45765
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHVeQ-0002kV-E4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:55:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso2400796wms.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 10:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cy56Mv14N6JZg8OkvXjGzZB24IADTCuUhWDnOlRaBOM=;
 b=u4q3QoQlqbDljV2EpmZleUqJUYohz4J2xrijszQsosorza3KgHDBVpspMVXhrKmhmF
 L/18hz4yfW3CoGXUx2IX+mwU+Rg3sJ5HS4pbm5ogythvMhbJMDzliEI2PuDmU/QBCtje
 cNLQKFXgg+hYQ5Ya1wxO+mZEhVAnaiCVEAEFm5WlDVSOvkrNcuuwjyTXce4isuGDDJzT
 5HE7IFH8p9IXv2D1i2l+eK+0wXL2GRZz0Jo/8rLeE70Xr1nNDouIgeCCjrt1c0iq+Ds+
 wuweFS4mMOylopZPL2GQN5Le71VyCR0fQO+FeDNn94LVCKyUAEhi32abrcejNEy/AGn+
 m+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cy56Mv14N6JZg8OkvXjGzZB24IADTCuUhWDnOlRaBOM=;
 b=K5uNbQFMfJFIqSNlOmlKULId+/mQuEEa44lKFyFbURQTwNdxQ/qzs5dfQM0rs36k2D
 62YgdWEgjSfJPZcIdLs3xDuhU6mswIogOxAgBk7Sb1zd6qAuaitXhiN+z4PqKF7dxq2E
 zbJbwX691msEEQl6mu3i847KBttYFt1BEROZjJcoHIxPvmultJ3O71ICLswS2rIGkydT
 z6t6ovacV+x+yz2dn3FuD75a121wUR9MDf2jH3esaIYsI3e9RCioGsMnvAM34Zz0KMwi
 mvZb+Av4ZenAK8xe//ZbxW6FUMmvqLDdyXLuuifELgW8CmNhsEKnRkLDVDsvXG/aJPg+
 RIxA==
X-Gm-Message-State: AOAM5311zDvvIlIDw2e6oS2T9NQuazU68kav8In8SkXAY64ZNdMtNAlN
 vgS0O2KXzobS9z+8fUsiCWPm6lxiMK7Fm9wZvRq+3A==
X-Google-Smtp-Source: ABdhPJxFQDYiiG5l/yb1cX39oaYsbYDH1q/mAng2YAZ7uF0eJ4pi/ZuUr9caFH52izVGhE68jX+gNl0m9D7toELiLxE=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr2206345wmf.133.1644346484631; 
 Tue, 08 Feb 2022 10:54:44 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
In-Reply-To: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 18:54:33 +0000
Message-ID: <CAFEAcA8Q5+cL8noZLKDwyhhuTfkN8tLcNmdqnWKSvDxoYcxp9w@mail.gmail.com>
Subject: Re: Adding a 'qemu.qmp' repository to gitlab.com/qemu-project/
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 19:47, John Snow <jsnow@redhat.com> wrote:
>
> Hi Peter:
>
> I am working my way towards splitting the QMP library out of the
> qemu.git source tree. I'd like to ask for permission to:
>
> (1) Create a "qemu.qmp" repository under the qemu-project umbrella on GitLab
> (2) Add Cleber Rosa and myself as maintainers of this repository. (In
> discussion, Dan Berrange suggested a third maintainer for redundancy,
> but nobody from outside of RH has yet volunteered. The offer stands,
> but I have to press on in the meantime.)

Since you asked me specifically, no objection, but agreed with
the other remarks in the thread about picking a more
obviously this-is-python-qmp-bindings indicating name.

-- PMM


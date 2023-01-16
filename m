Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BFA66C039
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHPsn-0008Fi-HF; Mon, 16 Jan 2023 08:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHPsc-00087t-D5
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:50:32 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHPsa-0005ze-8I
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:50:29 -0500
Received: by mail-pl1-x630.google.com with SMTP id y1so30396808plb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jzfMACBZcfY4hkCHTh1tjKMJKu8fAtcHzrByGZdQ7rM=;
 b=S1Lm/7OwzakI/cS5aQfWAefomNa5mw0jPPMaFV+MrExOEdp4tSh60PPjlmeuH1Hw72
 iAWiz2vL+dQ6JjeZehAvAg3/XBgwevVsJWotRswYcwmxG15FK0MyK/KsgEow2q9RT0k8
 7emUerL+Y3Ddf/p6GA+aYEV2TH3cbaL97Wumd1QhmYs+hzAADEaQ4SqX+yhKJzhv3J+6
 KZffuOTAFaiFnwWpE5tqkicGz+OYk5/zBtHbP5tX+NHmVvdnGZ+BMUnUpsSaRpIH39EX
 qSsZXVc6ReZy12zKq7U+b4zBx5vCQtiy6cNhZENQbrIE/5nw6pDPCV2+ANNFtV+mFIye
 1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jzfMACBZcfY4hkCHTh1tjKMJKu8fAtcHzrByGZdQ7rM=;
 b=we+Mg3mc/6TYPobPoIaW8RNQ9fS6U+SUhhPWe19pBOm2p4KNIBXzNVfO4L2EO6F20V
 MLIcxzsU8shF67oUe6nZr5zP/FngvVrNlGLbzaXt4asbt3034ukD/XMDU14Ahr/qjIMS
 h8CpiPiUypFEvoXggVUvZXxnfebLW2sMQWWMQwbh8MZfZgid9g0Xw2WrrQMu31pJM53c
 8YDwe1CBsr0NnWsbN95I6BPTT+4rkHDJHvpVs3LDtC7Gha1mN8hy054MeT4yBi/gupAl
 c6Fu32NnVx6f+jn7vGF3evZDNWSyONlG9gdN2SjrVQCVCC5GAmKGhGaNypjRRNplICka
 3n/g==
X-Gm-Message-State: AFqh2kqi3w002RF45M1tEGlu5w3CVdOxe4GrxG+Om+4iQBZzTRH6F+SG
 Y81KYaCd+7lnnPzltOVD5mNxvpnA6RGcoBL9TOdtYQ==
X-Google-Smtp-Source: AMrXdXsjubQReZkgGG6OzJxDbnm54HEYmOgtYpDo4spAQC660XGpSjp0IpgW0xAe8ryRoC0DmeAVQJN9cCUklZhD22k=
X-Received: by 2002:a17:90a:f50b:b0:229:2631:e8 with SMTP id
 cs11-20020a17090af50b00b00229263100e8mr919319pjb.215.1673877026847; Mon, 16
 Jan 2023 05:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org> <874jsqzj7m.fsf@suse.de>
In-Reply-To: <874jsqzj7m.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 13:50:15 +0000
Message-ID: <CAFEAcA8cUc28JBT7QikUirthUn7yP-BVV3+cibHryAGx5FWE+w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
To: Fabiano Rosas <farosas@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Mon, 16 Jan 2023 at 13:45, Fabiano Rosas <farosas@suse.de> wrote:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > On 1/13/23 06:04, Fabiano Rosas wrote:
> >> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> >> cortex-a57 as default cpu for KVM.
> >>
> >> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> >
> > Ideally there would not be a default at all, requiring the command-line option to be used.
>
> We could probably do that now without impact to users, since KVM would
> always require a -cpu option due to the current default being
> cortex-a15.
>
> >
> > Second choice would be "host", since that's the only value that's actually usable (except
> > for the off-chance that you're actually running on an a57, which is less and less likely
> > as time moves on).
> >
>
> I'll have to go around fixing qtest first, either to add -cpu or to add
> -accel kvm, otherwise we get:
>
> The 'host' CPU type can only be used with KVM or HVF

For a CPU type that will work with either KVM or TCG, that would
be "max".

thanks
-- PMM


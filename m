Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86646E76BF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 11:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp4S6-0001PP-4V; Wed, 19 Apr 2023 05:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pp4Ry-0001Ot-8S
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:50:07 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pp4Rv-0007LV-Uh
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:50:05 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so5320546a12.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681897799; x=1684489799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yu2QepAxq3Q96fLjnhjGLTOaYocasT5GORBuMwPnsoE=;
 b=hXS10rOwqzurZ/J3xpos4MdVll7O4h2PWg4U8BI6Z6ggC6O4+Idj3q/56prKWLcMiA
 dsQOGFscA02h9/ox0G3ASHMrttsa4aDW3zcTl9ttvL9nQXoVXbmSjiTu3SJsbQyYCNqp
 2WZ7U4ov2nq0ANb5Z5nUzO03h3oBItPttK2E/N4li3kuyCDVAXoDWQ+Zbbr3cwBayfE6
 8ZZeNDTvEBdXVYfusPvP1Hod6w5dp44FlrBqTXhURRTC3ub/VlwmA0iV319jk9dwDuCn
 BfYCNYq4zDIkCObAeSVogbXrGHcTcMoD0+Q1jR+tNb5qX0seyXqdaNn4MlOl5GY2MFCz
 I43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681897799; x=1684489799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yu2QepAxq3Q96fLjnhjGLTOaYocasT5GORBuMwPnsoE=;
 b=h0U0dHNw8BAwmZYSVZyC5nYSatltuwA0DE/vI3xarjFE0hsICSXlISzSBicewNVymF
 dkmcrDCzhIfLLPb8B3OzLxIqs0pYQwd+HoTcMNSfUS40VR7JGGQSNxffwtyx1n8MEoxG
 k7p6MU+rjmdxWwuqXqu5toyYbZuRON+U4ejk6l/Go0xV4zaBmiCdR07EiiacOjgZ4Uw8
 jTX1wQjTJChQOEikQ9r38j9jOw0LUWfJgDM1shsHiqIHAfk53gApshTSvEAjvJObhk1h
 1V+/E8lasIigpM9IVolBYBCYeDKMPLi6fBFnpRECB3dhUpexztP71quHC700I8ojnPoy
 Wf/g==
X-Gm-Message-State: AAQBX9c0GVLd/RiRSB/jlQsOC3aZCSjgLSnHZ9V8dXone8v4k4XQCAxm
 Gd1gfEMm2N4YZBahH8HXQ4s8SGOb0jOLUYbxXTKl4g==
X-Google-Smtp-Source: AKy350b5++ivT3lvDzYgqgJrwBwXxK3r22+z6CWWs4MmSsT3ErxXD2teVI4PwoGhCvXmRu/G8ta0amH55vYvAHpUyzM=
X-Received: by 2002:a05:6402:22dc:b0:506:bdbc:e59f with SMTP id
 dm28-20020a05640222dc00b00506bdbce59fmr878417edb.3.1681897799222; Wed, 19 Apr
 2023 02:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230413110019.48922-1-zhenzhong.duan@intel.com>
 <CAFEAcA9VsB7+yXG6XiyRAJ4TaUJVFAu4h-rT9ZN=+o5fu0S2cw@mail.gmail.com>
 <ZD6hhnUNVoHhIdgi@x1n>
 <SJ0PR11MB6744AADC581774FBEFFD458992629@SJ0PR11MB6744.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB6744AADC581774FBEFFD458992629@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Apr 2023 10:49:48 +0100
Message-ID: <CAFEAcA9tF0Rz-EsdKRVjgoyoZb-W5y_tvvGwcJ1FKTbz=GetLA@mail.gmail.com>
Subject: Re: [PATCH v3] memory: Optimize replay of guest mapping
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: Peter Xu <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 19 Apr 2023 at 03:38, Duan, Zhenzhong <zhenzhong.duan@intel.com> wrote:

> >> The documentation for the replay method of IOMMUMemoryRegionClass
> >> says:
> >>      * The default implementation of memory_region_iommu_replay() is to
> >>      * call the IOMMU translate method for every page in the address space
> >>      * with flag == IOMMU_NONE and then call the notifier if translate
> >>      * returns a valid mapping. If this method is implemented then it
> >>      * overrides the default behaviour, and must provide the full semantics
> >>      * of memory_region_iommu_replay(), by calling @notifier for every
> >>      * translation present in the IOMMU.
> >>
> >> This commit changes the default implementation so it's no longer doing
> >> this for every page in the address space. If the change is correct, we
> >> should update the doc comment too.
> >>
> >> Oddly, the doc comment for memory_region_iommu_replay() itself doesn't
> >> very clearly state what its semantics are; it could probably be
> >> improved.
> >>
> >> Anyway, this change is OK for the TCG use of iommu notifiers, because
> >> that doesn't care about replay.
> >
> >Since the notifier contains the range information I'd say the change shouldn't
> >affect any caller but only a pure performance difference.  Indeed it'll be nicer
> >the documentation can be updated too.  Thanks,

> Thanks Peter Maydell and Peter Xu's comments, will add doc update.
> May I ask if it's preferred to add doc update to this patch or a separate patch?

I suggest doing it in this same patch.

thanks
-- PMM


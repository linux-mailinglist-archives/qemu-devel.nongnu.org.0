Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D354FDFE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 21:59:42 +0200 (CEST)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2I85-0005qM-9c
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 15:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o2I6c-00059L-5T
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 15:58:10 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:42522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o2I6X-0007CB-EZ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 15:58:09 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ef5380669cso51976187b3.9
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcQo8wv/oavbAmJ2+Q+zaRoe/aKdHvx1a2FPpAjGeP0=;
 b=Eb2cXrHtzJB00FsQ3nLkTbX/W1EEhYKgJx5gVwTXKmIN9icJg/ZVT5ztAbyq+y1Ngw
 XwIMgyoe7PYKP7oVAc6uSPYHvTuA1cD8XUsiveAObfbrC6Ypcwq03ju2F2EmEGnzHEOt
 TDxGj+WvAu6Qb1FthCi7uOhvRnuMvzw+YrVJ8zloMaUi3e5zBbYb20pZWQ/oBRZaDyxQ
 CsWMsN/oQWAaDd+LN0cqDp4qeFnwHElyquN8h/MZMl4q6YgHasDGDzTXobQBdB7neIhy
 K5pLB1fhFhO/Zta8nl8SMdQu/lvYBp1bt+KAlP0t0sEXWSF/0QCyxk8UTzlqWV+rdz/I
 pViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcQo8wv/oavbAmJ2+Q+zaRoe/aKdHvx1a2FPpAjGeP0=;
 b=DASTrM4i0wCZ+Da1g5T4ndMz1OBkRq0AlWIuULJl+UHz4Iq5mD1QYf6Aj7I6KkVc19
 stpc9nTIsl7w2GzhJfdegDwepKXHhGg/My8YwHlL8UlrOID4EJX4Gt33gMdkAOXs1uKN
 f3EaeVVXEin1lpIy6gcKLW8DYTkON7SzvvzsadXOoigh6JGceqJBXthvOJOA/e6xoPPK
 f2M+99rgeOc6pDsSGCGNvtiBwhpzsUfGBQKSeryXXxvCfCEYZLPcpF3zmIIrXbBMgoDT
 SS5JrPruStCaCBbhlOS0qJM3wUFTl5D8iLBc8170PHiP9EjEmFILL2TR5A9Mg7HgoJBB
 2A/A==
X-Gm-Message-State: AJIora/nNmY+W1Rgi6hxm7TSxjgx7QMX7k9ixNdHIhoppqTxlBaCE0Za
 9zdK/PWkVkVLGEehpEx48ayOJeozTE7g2qcvgm+bdw==
X-Google-Smtp-Source: AGRyM1vWRCHwfcWzHz+BZj7FBqUt6bUGO1IzajWXhDKgL67gven1G0nG2YfbhzmnrgI5YorS9vH/S8l2UNGT7dfI1jc=
X-Received: by 2002:a05:690c:18:b0:314:cf3:3c79 with SMTP id
 bc24-20020a05690c001800b003140cf33c79mr14102246ywb.72.1655495883645; Fri, 17
 Jun 2022 12:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <a89cb720-3600-51ad-2671-ea0f987cd3d1@intel.com>
 <20220616082846.wtmf3wbxzilzvqt4@sirius.home.kraxel.org>
 <503fadf7-c6d1-61dd-236e-fcca895e8aef@intel.com>
In-Reply-To: <503fadf7-c6d1-61dd-236e-fcca895e8aef@intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 17 Jun 2022 12:57:52 -0700
Message-ID: <CAAH4kHYK5XRUvUC3-QeRuFGn1uTu6LJ=TOHik_oOqw0PSYoKOw@mail.gmail.com>
Subject: Re: New "IndustryStandard" fw_cfg?
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Xu, Min M" <min.m.xu@intel.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, 
 "Yao, Jiewen" <jiewen.yao@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=dionnaglaze@google.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think the option should be boolean since it doesn't look like we're
going to need to tune the number very much.
It all boils down to "does the OS affirmatively support unaccepted
memory?" as in, we have no way to negotiate it, but force unaccepted
memory on.
Ovmf can interpret the existence of an opt/ovmf/unaccepted_memory file
to mean that it's allowed to create unaccepted memory entries in the
memory map.
It's then up to the firmware if it will minimize its use of unaccepted
memory or not. It's not Qemu's place to say.


> >    * accept all memory below 4G
> >    * accept all memory
> >
> > Possibly we need:
> >
> >    * accept all memory below 4G
> >    * accept all memory below 4G, plus x GB of high memory.
> >    * accept all memory
> >
> > In any case the config option should be designed in a way that we can
> > add a 'automatic' choice later, i.e. we can have ...
> >
> >    * automatic (default)
> >    * accept all memory below 4G
> >    * accept all memory
> >

I think "false" can mean either accept all memory or "do what you need
to" and negotiate if the memory map boot service can create unaccepted
memory entries. Whichever appears supported.
Then "true" can be "do whatever, including creating unaccepted memory
entries in the memory map".

That seems the simplest way to allow a configuration of this feature.

-- 
-Dionna Glaze, PhD (she/her)


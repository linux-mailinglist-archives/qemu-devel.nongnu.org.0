Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D9551C536
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:33:55 +0200 (CEST)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeQM-0001Mc-FX
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmeAG-0000Pz-HE
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:17:16 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:33933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmeAE-0005RC-KZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:17:16 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7c424c66cso54367957b3.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRybkz4Gg6uEXQFuaT+Uya05SlzTgm34I8DsPnxOA4E=;
 b=qwedfi3X+xIfiN0jcTLk3cTI99waC/NzW0OMfViI+ooHsh2OC/nvHZXp1bgg66kgUv
 jzuHSI/Vb/7aKvn/ajj7YGVG/4TPS3pCom+t9bD7LfcmO2jUAHiys6tvjN5G+oTWLeuz
 Nv/A+yxl6rb4vIKaotYy7dNXOldXGF3MMSG5CeBys3g1tnBFewxTVfkbQfLRWXLVhGe5
 FwAI3lWtXAfmTOkmFy1pRcfz+QBkHBtxvqFp9jWHNkBVxyNOQ3TLobZZvkb5to66/Gz1
 5p9QzbwyTOKyKBBgYilmgdIBQDqLaHakjgVVYLqitqavaJYLeogNqylJ7IZhGBSibESn
 07Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRybkz4Gg6uEXQFuaT+Uya05SlzTgm34I8DsPnxOA4E=;
 b=o/Ems/YU4AZEVvrWo0kLWwShkHKY0vDvB0Ev0xnvFD0YjczcqDlEsWjhMg1k98qjat
 yu0vUYsBJOR2nEbexLfn2kYS+UfZ7wmeGzQ3a0E48RDPIIFUZOJ6Sx9nLZ17NTiiuf3W
 RrNLIV2p0Z0zgaQMQPaXBevVTUlEWtt+aZXP9a4Zko+pQkczf9sqUD6ojBuGKEtWj8tv
 VVl5PuIadfvum1f0EARtRP34I5Uov+V5kwJnKlyZUy+WepjImzIlPhPcjSN4IUb4YXXE
 hKPd/vCn63826x2RzZcYJi7fyw27sx4JgKU+KqmiPgpLNHYcyZm9eIJ4VaXC5uHZzIQO
 XCXQ==
X-Gm-Message-State: AOAM532WtyyDX1RK1sjdVHxXeY0UjTbfZvGakeGo6wHGuqqLx7kPcuOm
 4jTn363zi4SXrFNDGlOxEubE++ltdSnQah+mEK/f5w==
X-Google-Smtp-Source: ABdhPJyoSi8/8SMgnqyhd/rSd28KHeYOh6O3R4cg1xMiFn3WaHSAAvl78ZCXiVcoCGwmUIl7W4Qoa6z+A81Q09R4jXY=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr26266810ywb.469.1651767432774; Thu, 05
 May 2022 09:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
 <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
In-Reply-To: <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 17:17:01 +0100
Message-ID: <CAFEAcA9fOH1=hseVHwsvsJujeiB6cXn6BFnxyp36vYnmjVsp0Q@mail.gmail.com>
Subject: Re: [PATCH v9 06/17] vfio-user: build library
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 mst@redhat.com, 
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com, 
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com, 
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com, 
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, 
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 May 2022 at 16:44, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, May 03, 2022 at 10:16:47AM -0400, Jagannathan Raman wrote:
> Ubuntu 20.04LTS has CMake 3.16.3:
> https://packages.ubuntu.com/focal/cmake
>
> That does not meet the minimum version requirement in this patch series
> (3.19.0).
>
> Please re-run container build to check if Ubuntu actually works.
>
> Hopefully libvfio-user will support meson and CMake can be dropped from
> this patch series.

Yes, please. I really strongly don't want QEMU to acquire
a dependency on yet another build system.

-- PMM


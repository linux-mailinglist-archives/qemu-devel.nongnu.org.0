Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DE59BD4E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:05:11 +0200 (CEST)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4Iv-0002pw-IV
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ4GS-0000jR-Df
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ4GP-00006L-7v
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661162552;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cbwz0+tpe5bav+xklN4gO6sWjuNh2tla0UnuntHaYAU=;
 b=INzAZluc3Qh17ldI8Wr5mVipvskUnEE/5lnV5cGNYZQdmPLoLtKokLH6d/NZ2jsFELKoOu
 jC3GYROgx5xpwngIy96exyVdkBWLb6f9eJ50XU+r28Mao2wJ3j0scH7CKxbXlxL1+fSIYE
 2DxuEHi65gUgGnnX/FuQqnh+zOQHK4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-J3lxM2dkMi-hHyOso51PZA-1; Mon, 22 Aug 2022 06:02:28 -0400
X-MC-Unique: J3lxM2dkMi-hHyOso51PZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A1F48039A8;
 Mon, 22 Aug 2022 10:02:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D474E140EBE3;
 Mon, 22 Aug 2022 10:02:26 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:02:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: luoyonggang@gmail.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
Message-ID: <YwNUMLxx2HqWUCXs@redhat.com>
References: <20220728200422.1502-1-luoyonggang@gmail.com>
 <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
 <CAE2XoE8M+Tz3t=zh5GhX+vYCipNRdZUYieSjtAO2OUsJcYnAPw@mail.gmail.com>
 <2ac21034-c728-04ad-cb33-07870c1f0cc3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ac21034-c728-04ad-cb33-07870c1f0cc3@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 09:50:20AM +0200, Thomas Huth wrote:
> On 16/08/2022 20.53, 罗勇刚(Yonggang Luo) wrote:
> > I have reason to think that's msys2-64 bit failed because out of memory
> > 
> > I tried to show the memory size of the windows docker, it's result
> > are 6224352KB, that's less than 6GB?
> > https://gitlab.com/lygstate/qemu/-/jobs/2891399652
> > <https://gitlab.com/lygstate/qemu/-/jobs/2891399652>
> > 
> > Can we increase the memory size to 16GB
> 
> I'm not aware of any way to increase the memory size for gitlab jobs ...
> Daniel, Alex, do you maybe know?

I don't bvelieve there's any option

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



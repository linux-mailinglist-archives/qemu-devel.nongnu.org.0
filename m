Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75B6BB871
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:50:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcTNa-0000Vy-1b; Wed, 15 Mar 2023 11:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcTNV-0000VR-N4
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcTNT-00069I-J7
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678895360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKP9QAK33gzRW6Fqiehue1c0ro8eEqlYvKww+u4/sfs=;
 b=VyJB8Ho+7c5naB5Gq2XViPK1zrBEI89Zc3dXLk0nT7+RRQFXsiECtlLBtRx6BbjIHsKQ4D
 L473yBREn469ccuSznUCCKEUsR4KCR07PpQPdC/IVbs/j5Z1gD+LTZkeNRSwJ+Z2YLUEd2
 a7kts3rywZepO+TEv6ebI5R5z+YHzbw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-NfisyIPONEKlrzG27WXolg-1; Wed, 15 Mar 2023 11:49:16 -0400
X-MC-Unique: NfisyIPONEKlrzG27WXolg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62BAE1C1742D;
 Wed, 15 Mar 2023 15:49:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 347351121314;
 Wed, 15 Mar 2023 15:49:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C15CA1800393; Wed, 15 Mar 2023 16:49:14 +0100 (CET)
Date: Wed, 15 Mar 2023 16:49:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Simon Glass <sjg@chromium.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PULL 2/3] edk2: replace build scripts
Message-ID: <20230315154914.d2st3c6ioy62cku3@sirius.home.kraxel.org>
References: <20230309115714.906369-1-kraxel@redhat.com>
 <20230309115714.906369-3-kraxel@redhat.com>
 <CAPnjgZ3M4LCXJq6=V-zt3QiiP6PjcL5kUrBB-9OdZghC-sK12w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3M4LCXJq6=V-zt3QiiP6PjcL5kUrBB-9OdZghC-sK12w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

  Hi,

> The README should mention that you need to use
> 
> . edk2setup.sh
> 
> first.

The script will do that if needed.

> Also you need to be in the edk2 directory, I think.

Or use the --core switch, or place the location in the config file in
the [global] section.

> It would be good if the edk2-clone.sh script could deal with updating
> an existing checkout so I don't need to remove the old ones each time.

Updating is just "git pull && git submodules update".

> edk2-build.py -c ../edk2-build-config/kraxel/x64.platforms -j30 --silent

That config file expects cwd being edk2-platforms and edk2 being placed
next to it (../ekd2).  edk2-non-osi too.  See the [global] section at
the start of the file.

> BaseTools/BuildEnv: 160: Bad substitution
> Using Pip Basetools
> BaseTools/BuildEnv: 184: Bad substitution
> BaseTools/BuildEnv: 202: -c: not found

Ok, tried updated the script to use bash not sh for that.  Does this
work better for you?

> Do I need to make -C BaseTools first?

No, the script will do that.

> > +import optparse
> 
> I think this is obsolete and argparse should be used for new things.
> The conversion is pretty easy.

Done.

> Silent mode still produces output. Can you add a -s alias and also
> make it fully silent?

Well, silent means no output from the "build" command, so the console is
not flooded with build logs (unless there are build errors), output is
written to logfiles instead.

> If the config file is not found, it seems to say nothing, but just
> does not work. It should give an error.

Fixed.

take care,
  Gerd



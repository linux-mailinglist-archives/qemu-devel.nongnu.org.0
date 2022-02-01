Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99484A5802
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 08:44:40 +0100 (CET)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEnqA-0005wb-5P
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 02:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1nEmjr-00046o-E7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:34:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1nEmjp-0007BF-NT
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643697240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cg3mIiWd/9TFrtq2QWoRRKwZQy1JE98GgJa2hs+6QeQ=;
 b=OwqaTOBmM4gqcNA5hc5ylwNNU6NKf3JRrWt0iYC0KmJ+IvhqEI0aTUB8Is7ePui+A4Az7g
 5/fgOQY1Kq1IJRuQjvXiAimIst0VIodMJMMWSvHW2lpnQZ75mOH4IFYtlYh4oG+AFzGJad
 lK5jbihnv7oGkERU9nqdT0PAYtWArew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-40h_9PGPOJ6R5TR16Fq_2w-1; Tue, 01 Feb 2022 01:32:38 -0500
X-MC-Unique: 40h_9PGPOJ6R5TR16Fq_2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4FCE2FD1C;
 Tue,  1 Feb 2022 06:32:36 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 026E36C1A5;
 Tue,  1 Feb 2022 06:31:41 +0000 (UTC)
Date: Tue, 1 Feb 2022 07:31:39 +0100
From: Stefano Brivio <sbrivio@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <20220201073139.7896e10b@elisabeth>
In-Reply-To: <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.625, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Tue, 25 Jan 2022 10:20:11 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > IMHO the ideal scenario would be for us to have a kernel, initrd
> > containing just busybox tools for the key arch targets we care
> > about. Those could be used with direct kernel boot or stuffed
> > into a disk iamge. Either way, they would boot in ~1 second,
> > even with TCG, and would be able to execute simple shell scripts
> > to test a decent amount of QEMU functionality.  
> 
> I have some test images based on buildroot which are essentially that.
> https://gitlab.com/kraxel/br-kraxel/
> 
> Still a significant download, but much smaller than a full fedora or
> ubuntu cloud image and it boots much faster too.  Not down to only one
> second though.

I'm not sure you can recycle something from it, but my (ugly) approach
to make this fast (for a different purpose -- I'm using qemu to run
tests in guests, not testing qemu) is to build an initramfs by copying
the host binaries I need (a shell, ip, jq) and recursively sourcing
libraries using ldd (I guess I mentioned it's ugly).

No downloads, systemd, dracut, etc., guest boots in half a second
(x86_64 on x86_64, KVM -- no idea with TCG). Host kernel with a few
modules packed and loaded by a custom init script.

If you're interested, you can see it in operation at 3:11:17 (ah, the
sarcasm) of: https://passt.top/passt/about/#continuous-integration
(click on the "udp/pasta" anchor below, it's a few seconds in), or in
slow motion at 0:51 of https://passt.top/passt/about/#passt_2.

It's basically:

  git clone https://mbuto.lameexcu.se/mbuto/ && cd mbuto
  ./mbuto -c lz4 -p passt -f img # Profiles define sets of binaries
  ${qemu} -kernel /boot/vmlinuz-$(uname -r) -initrd img

-- 
Stefano



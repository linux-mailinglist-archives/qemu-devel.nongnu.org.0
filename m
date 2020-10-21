Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD84294D81
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:30:10 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVEBt-0003Gq-Jg
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kVEA4-0001NL-TW
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kVEA1-0004Iu-RD
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603286893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vcl+iMOeA6mZdPOlGtKj0djqhArN3qwt8shuWOfDvyk=;
 b=T9XM4aOfFzjmBpnxubhM9upqTsAFnbqIJo2fpHXSPMlSGFK8/4rAGgb++Yk7p54Z3atOtx
 ykC0fBX+Kr5tPQ2PJxHiPwJ5tIVr8ZiE9YsOWKrhnr1Yq9Za4CW0rjSTfp3xfUw2HMVtTH
 DnZl2in/xTZHqkRGZxqbBLDuSkH3jv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Dws_Y1joMiyyGCG4a46kMw-1; Wed, 21 Oct 2020 09:28:10 -0400
X-MC-Unique: Dws_Y1joMiyyGCG4a46kMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD88C64093;
 Wed, 21 Oct 2020 13:28:08 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC8075C1C7;
 Wed, 21 Oct 2020 13:28:07 +0000 (UTC)
Subject: Re: roms/efirom, tests/uefi-test-tools: update edk2's own submodules
 first
To: Olaf Hering <olaf@aepfle.de>
References: <20201020091605.GA2301@aepfle.de>
 <3fc07eb7-f99a-516b-9bb9-e48049547928@redhat.com>
 <20201020094419.GF287149@redhat.com>
 <0e196d48-6735-5116-ade5-a9b138020aea@redhat.com>
 <46f7af9f-4a18-4352-dad2-cc176ed890e1@redhat.com>
 <20201021143015.3bd7faff.olaf@aepfle.de>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4925ad98-cc98-1e59-efe9-ee561e85a7d0@redhat.com>
Date: Wed, 21 Oct 2020 15:28:06 +0200
MIME-Version: 1.0
In-Reply-To: <20201021143015.3bd7faff.olaf@aepfle.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 14:30, Olaf Hering wrote:
> Am Wed, 21 Oct 2020 14:05:18 +0200
> schrieb Laszlo Ersek <lersek@redhat.com>:
> 
>> Olaf: if you build QEMU from source, why don't you build SeaBIOS, iPXE,
>> edk2 etc *also* from their corresponding pristine upstream clones /
>> checkouts, using your own dedicated build scripts / packagings?
> 
> From my perspective it is like that:
> 
> I export xen/qemu/libivrt into an offline environment for building.

Makes sense.

> The "git clone/git export" is done without submodules, but each required submodule is of course cloned/exported as well into the target directory.

The "roms/edk2" submodule of QEMU is *not required* for building QEMU.

> In the end it is me who decides what is required or not, which means only a subset of all submodules need to be provided. The build process sees the complete source, and as a result nothing needs to be downloaded.
> 
> With current master there are these two offending git commands. In my environment they can not do anything but fail. I guess once the next qemu-X.Y release becomes available as the usual "qemu-X.Y.tar.xz" release these git commands will fail as well with 'make -C roms efirom'.

I can't fathom why someone would want to run "make -C roms efirom"
against a tarball release of QEMU. That command does not participate in
building QEMU proper. It participates in refreshing some binaries that
serve convenience and/or self-check purposes.

(In case of edk2, there isn't even a legal/licensing requirement for
distributing the source of the firmware, along with the binary. See
"pc-bios/edk2-licenses.txt".)

> As said elsewhere, the correct approach might be to check what is missing and download only these submodules. This should take the existing configure knobs into account.

The "make -C roms efirom" command was never meant to work in the
environment -- such as an offline environment -- in which you have been
running it. I have not once tested the build scripts like that.

I'm OK to review and regression-test patches to this end, but I'm not
interested in authoring them (nor in testing them in an offline env).

Thanks
Laszlo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA47102415
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 13:16:34 +0100 (CET)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX2Qq-0006lx-Ck
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 07:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iX2OI-0005SO-D4
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 07:13:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iX2OH-0007Ec-9a
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 07:13:54 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53207
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iX2OH-0007Dy-6K
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 07:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574165632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCkTIDPJQ/abhC03uB7gF12UKMEDRb5zCuL77CFvk3E=;
 b=DGnLy6af4oNFmoNCTe07jq45iXvIFT5sJvmkfn/FEgMy6EBdGkyfS6lFuQtsaifQh+FKeM
 8GcuBDndPErqERwBOxqFPAoVYjLSBAcaVUvLrazSO6iUa3oCzWGgRuYrl6vSZSdaf5dLCu
 GAbnXmBTrURb0GPRK9oK94TcE54Rmug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-McPh55VNNqaWkeXx0cPCrA-1; Tue, 19 Nov 2019 07:13:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0731B477;
 Tue, 19 Nov 2019 12:13:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F48691B0;
 Tue, 19 Nov 2019 12:13:35 +0000 (UTC)
Subject: Re: [PATCH v1 5/5] .travis.yml: drop 32 bit systems from
 MAIN_SOFTMMU_TARGETS
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191113115952.775-1-alex.bennee@linaro.org>
 <20191113115952.775-6-alex.bennee@linaro.org>
 <3782cc8a-72c4-3509-0c70-7f03753b36f3@redhat.com>
Message-ID: <b5c4eed3-509e-cad9-b7f3-1271e021f6cc@redhat.com>
Date: Tue, 19 Nov 2019 13:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <3782cc8a-72c4-3509-0c70-7f03753b36f3@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: McPh55VNNqaWkeXx0cPCrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/2019 14.30, Thomas Huth wrote:
> On 13/11/2019 12.59, Alex Benn=C3=A9e wrote:
>> The older clangs are still struggling to build and run everything
>> withing the 50 minute timeout so lets lighten the load a bit more. We
>> still have coverage for GCC and hopefully no obscure 32 bit guest only
>> breakages slip through the cracks.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  .travis.yml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index b9a026c8eeb..c09b6a00143 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -79,7 +79,7 @@ env:
>>      - BASE_CONFIG=3D"--disable-docs --disable-tools"
>>      - TEST_CMD=3D"make check V=3D1"
>>      # This is broadly a list of "mainline" softmmu targets which have s=
upport across the major distros
>> -    - MAIN_SOFTMMU_TARGETS=3D"aarch64-softmmu,arm-softmmu,i386-softmmu,=
mips-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86=
_64-softmmu"
>> +    - MAIN_SOFTMMU_TARGETS=3D"aarch64-softmmu,mips64-softmmu,ppc64-soft=
mmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
>>      - CCACHE_SLOPPINESS=3D"include_file_ctime,include_file_mtime"
>>      - CCACHE_MAXSIZE=3D1G
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>

On a second glance, we also have this entry with --target-list-exclude
in our test matrix:

    - env:
        - CONFIG=3D"--disable-user
--target-list-exclude=3D${MAIN_SOFTMMU_TARGETS}"
        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-default"
      compiler: clang

So while you've speed up one target, this one might get actually slower
instead. That's a little bit unfortunate. Is there maybe a better way to
tackle this?

 Thomas



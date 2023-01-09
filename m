Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D498E662B76
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvEW-00077r-Kc; Mon, 09 Jan 2023 11:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pEvEU-00077P-Gg; Mon, 09 Jan 2023 11:42:46 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pEvES-0000ga-Qm; Mon, 09 Jan 2023 11:42:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E3181FD93;
 Mon,  9 Jan 2023 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673282562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdI81UaCvhNm3g/O2k1hG7XmGPh04uIBAka7+j2jxQE=;
 b=KBGjQCnvnGx0hKJLsijAG7sthUuoDST4Imx/DxoNrBvF+qXcmSGM/OYinJtkHpJPUowZ2T
 kSRNXyqbRcMHpeRxOZ2R5MQajVPvfIFq/BRhi4va1RHak+zAJXDslVd7WWF5d/MrH4430Y
 vYYs2yrEoZnE5RMPs73/m/HAqufP3Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673282562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdI81UaCvhNm3g/O2k1hG7XmGPh04uIBAka7+j2jxQE=;
 b=q+fVyjd8cMevDxmAY+ycn+Sd/CS9cHgI0eIrDrP9ofPgwE8UiN/ervzGlCIO6FI5ObK4FW
 yXNcvVRqKlB8iTDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EEFF13583;
 Mon,  9 Jan 2023 16:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XovWFAFEvGPMewAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 16:42:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Cleber Rosa
 <crosa@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: add machine:none tag to version.py
In-Reply-To: <2a1d1243-2675-8be8-c35f-8c072065645e@linaro.org>
References: <20221215224725.3236-1-farosas@suse.de>
 <2a1d1243-2675-8be8-c35f-8c072065645e@linaro.org>
Date: Mon, 09 Jan 2023 13:42:38 -0300
Message-ID: <87pmbnpsld.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 15/12/22 23:47, Fabiano Rosas wrote:
>> This test currently fails when run on a host for which the QEMU target
>> has no default machine set:
>>=20
>> ERROR| Output: qemu-system-aarch64: No machine specified, and there is
>> no default
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/avocado/version.py | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
>> index ded7f039c1..dd775955eb 100644
>> --- a/tests/avocado/version.py
>> +++ b/tests/avocado/version.py
>> @@ -15,6 +15,7 @@
>>   class Version(QemuSystemTest):
>>       """
>>       :avocado: tags=3Dquick
>> +    :avocado: tags=3Dmachine:none
>>       """
>>       def test_qmp_human_info_version(self):
>>           self.vm.add_args('-nodefaults')
>
> Looking at previous attempt in=20
> https://lore.kernel.org/qemu-devel/20220104122104.849084-1-alex.bennee@li=
naro.org/
>
> * tests/avocado/empty_cpu_model.py
>
>    Forced via vm.add_args('-machine', 'none')
>
>    tags=3Dmachine:none would be cleaner.
>
> * tests/avocado/info_usernet.py and
> * tests/avocado/vnc.py
>
>    -> Fixed by 5104b73824 ("tests/avocado: set -machine none
>    for userfwd and vnc tests")
>
> * tests/avocado/version.py
>
>    -> This patch
>
> * tests/avocado/migration.py
>
>    =3D> Missing

I think the migration test is a bit harder because the machine type
would probably influnce the test. We would have to find a way to
specificy the different -machine options for each architecture. Or a way
of saying "use default machine, except for arm".

>
> Maybe we can squash to this patch?
>
> Meanwhile:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks


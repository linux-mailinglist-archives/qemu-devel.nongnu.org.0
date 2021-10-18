Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE754310B0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 08:39:50 +0200 (CEST)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcMJJ-00063s-F8
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 02:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mcMHF-0005NK-Cu
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:37:41 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:33185
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mcMHD-0003QR-Me
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:37:41 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HXnHJ1xkkz8PbN;
 Mon, 18 Oct 2021 02:37:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=SEliEx9QP
 dG9sQoMD6UbJynMDGk=; b=kEEqEU7vLmsJG6Ff4yWvrqfGnZB3BPZwQB5c18YFC
 1FunxXRFCrpdL07TXvExFID26FpCRnhtmbGhLZcbHjOeLuF3+wjAJMFSuiHkk4KR
 GxY9Z+ZoPI5+TSjsppLNF8T7NIK/RzNGZxc7Ir7/R8EBCTi5OlBx9I5hztobfNud
 ak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Du7
 4ifVePvO1gQJwBjlT0eAroVvS7ghPixoqr29/WeFNUxi3RWocnHCejO3aEfVQkMm
 sfri+1Kut6MHV2uoKsfOnJWJBnbuwnMs2CppUMstMwG3AeSnxP/3RksToCAKw0Aw
 P1rQZK0CfRkjhszNjcMXh1cYSNFaCatSMTGbLw4w=
Received: from [IPV6:2001:470:b050:6:9c06:a4f3:4bee:e7c8] (unknown
 [IPv6:2001:470:b050:6:9c06:a4f3:4bee:e7c8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HXnHH5ng0z8PbK;
 Mon, 18 Oct 2021 02:37:31 -0400 (EDT)
Message-ID: <09375457-8c92-ea07-d987-a493801b9879@comstyle.com>
Date: Mon, 18 Oct 2021 02:37:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH] tests/vm: update openbsd to release 7.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
References: <YWtYi8A2KaJ8PG9K@humpty.home.comstyle.com>
 <b32ccbe3-6db2-fb9b-be9b-6c418868b62f@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <b32ccbe3-6db2-fb9b-be9b-6c418868b62f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/2021 2:28 AM, Thomas Huth wrote:
> On 17/10/2021 00.56, Brad Smith wrote:
>> tests/vm: update openbsd to release 7.0
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>> ---
>> =C2=A0 tests/vm/openbsd | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>> index c4c78a80f1..abf510e117 100755
>> --- a/tests/vm/openbsd
>> +++ b/tests/vm/openbsd
>> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name =3D "openbsd"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch =3D "x86_64"
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 link =3D=20
>> "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
>> -=C2=A0=C2=A0=C2=A0 csum =3D=20
>> "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
>> +=C2=A0=C2=A0=C2=A0 link =3D=20
>> "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
>> +=C2=A0=C2=A0=C2=A0 csum =3D=20
>> "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D "20G"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs =3D [
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # tools
>
> That does not work for me. It hangs in the "DNS domain ..." line
> until it times out. When I disable that line with:
>
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index abf510e117..dfefb6bba3 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -98,7 +100,7 @@ class OpenBSDVM(basevm.BaseVM):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send=
("IPv4 address", "dhcp\n")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send=
("IPv6 address", "none\n")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send=
("Which network interface", "done\n")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait_send("DNS=
 domain name", "localnet\n")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #self.console_wait_send("DN=
S domain name", "localnet\n")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait("Pas=
sword for root account")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_send("%s\=
n" % self._config["root_pass"])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.console_wait("Pas=
sword for root account")
>
> ... then it succeeds the installation... could you please check
> with a fresh install on your side whether you could reproduce
> this problem?

I was actually looking at that particular line when looking at the other=20
diff
Richard sent out.

With the installer sub-routine the question is only asked under a set of
conditions and since there is only one physical interface as far as I kno=
w
of and using DHCP then that question is never asked. I don't see it when
I was verifying the steps.

 =C2=A0=C2=A0=C2=A0 # Get & apply fqdn to hostname. Don't ask if there's =
only one=20
configured
 =C2=A0=C2=A0 =C2=A0# interface and if it's managed by dhclient and if th=
e domain name is
 =C2=A0=C2=A0 =C2=A0# configured via dhclient too.
 =C2=A0=C2=A0 =C2=A0resp=3D"${_dn:-$(get_fqdn)}"
 =C2=A0=C2=A0 =C2=A0if ifconfig dhcp >/dev/null 2>&1 && [[ $NIFS =3D=3D 1=
 && -z $_dn ]]; then
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 # If we have a 'domain-name' optio=
n in the lease file use that.
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 # It might *NOT* not be the same a=
s the first domain in any
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 # 'domain-search' option.
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 set -- $(get_ifs dhcp)
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 set -- $(lease_value /var/db/dhcpl=
eased/$1 domain-name)
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 [[ -n $1 ]] && resp=3D$1
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 echo "Using DNS domainname $resp"
 =C2=A0=C2=A0 =C2=A0else
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ask "DNS domain name? (e.g. 'examp=
le.com')" "$resp"
 =C2=A0=C2=A0 =C2=A0fi
 =C2=A0=C2=A0 =C2=A0hostname "$(hostname -s).$resp"

> =C2=A0Thanks,
> =C2=A0 Thomas
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3783264892
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 17:06:43 +0200 (CEST)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGO9q-0002mc-Fh
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 11:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1kGO8Q-0001kv-V3; Thu, 10 Sep 2020 11:05:14 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1kGO8P-000583-C9; Thu, 10 Sep 2020 11:05:14 -0400
Received: by mail-qv1-xf33.google.com with SMTP id cv8so3470934qvb.12;
 Thu, 10 Sep 2020 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dygK7KtUneWiOqTSITgqg1vwJrAxyQ1Bgf3l5/fUDtA=;
 b=Jq9VI7sflU/3Fns7bIny1Mu5hVgpOwPNTOMqAvXs2b836KqVC+ZUEXzSH/g0yOOom/
 8uWGX7QVi+nfIEe0CrT9hDEVOL2bTcWc7W00AWWSRs+cXBV+ne8n08/y4XrFUicsB4oq
 F7z5auhZfK9y9YWRsIAoTw164nzQLvgDw2YcrNQvNqE+n4iOLznxD93CphJzcOVbtsZD
 f94/SkzbmTXfmwOfQSsdzMJUPxgz3kD27/XIwQAHGU0CkhpQZltrKGHmI1XP5D+yWRrJ
 GCqqpKZ54TEvz+9T3Lpah6wfmvy8EZAjsdpE+374DB0KWYiByxC7DmhOvhxUuj7YnSrB
 fCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dygK7KtUneWiOqTSITgqg1vwJrAxyQ1Bgf3l5/fUDtA=;
 b=aEbh5z0ZrnPaFs/Ba5OJIWhnn8OgLVBeqPUiq5Mfp+Nvybx6qll7LvkicS9xLcVa6M
 19SXF3piXdzdGOr5lu5rD9V+SCh+D/CnUo+TxXYHYSnPMlmnGKVvPSEdHgABC3Fm/J6L
 Xk6WUSbVm9fyGTeTdzli97WTGkMwCBbTx+jyhNpZIO+iyFTERTpOZmTtnQAYX6rqCXsK
 l/zr60VhP1FYFk+udJvRYc+uzi6vWsisl7Ga4G0D5U/q1nAaymCAwoKmlzPOAVsjW5iW
 CTxrL0V8xG91s8qbT+jYSLj5ayasm70vWr+CKt+RywqgTGKjF3gS4dE8wo2pDaJ2uWqg
 /6cA==
X-Gm-Message-State: AOAM530k5BjeQt0HlEhITs28IjEtI2Pl7VC98hYrNChM4+RSwAOAdxWT
 qBNClgXwTQWbzqFiVLPa2qCBk3+ZqaqyITgfr4FQ16pPx57Bdw==
X-Google-Smtp-Source: ABdhPJwKrZ4lGn0BmgVQ8fIHI91cZ701y2/wgzHgNc2ZNnRPad7jglY6CHGq+1GNluLvipMMiWvHWY/kuu45dqgDeQI=
X-Received: by 2002:a05:6214:bcf:: with SMTP id
 ff15mr9160570qvb.39.1599750311019; 
 Thu, 10 Sep 2020 08:05:11 -0700 (PDT)
MIME-Version: 1.0
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Thu, 10 Sep 2020 11:05:00 -0400
Message-ID: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
Subject: Master cannot execute MTE instructions
To: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000004888605aef6e599"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qv1-xf33.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000004888605aef6e599
Content-Type: text/plain; charset="UTF-8"

Hi,

As of commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a compiled with the
default configuration, softmmu-aarch64 issues an illegal instruction fault
when executing a memory tag instruction.  Below is a minimal code example
that triggers the bug.

#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define ADDRESS_TAG_START 56
#define PROT_MTE 0x20 /* Taken from arm Linux commit
df9d7a22dd21c926e8175ccc6e176cb45fc7cb09 */

int main(int argc, char** argv) {
uintptr_t m = (uintptr_t)mmap(NULL, 16, PROT_MTE | PROT_READ | PROT_WRITE,
MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);

if(!m) {
printf("mmap failed\n");
exit(1);
}

uintptr_t tagged_addr = m | (1ul << ADDRESS_TAG_START);

asm("stg %[tag], [%[addr]]"
:
: [tag] "r"(tagged_addr), [addr] "r"(m)
:
);

printf("Tag completed\n");
return 0;
}

-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--00000000000004888605aef6e599
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>As of commit 9435a8b3dd3=
5f1f926f1b9127e8a906217a5518a compiled with the default configuration, soft=
mmu-aarch64 issues an illegal instruction fault when executing a memory tag=
 instruction.=C2=A0 Below is a minimal code example that triggers the bug.<=
/div><div><br></div><div>#include &lt;sys/mman.h&gt;<br>#include &lt;stdio.=
h&gt;<br>#include &lt;stdlib.h&gt;<br>#include &lt;stdint.h&gt;<br><br>#def=
ine ADDRESS_TAG_START 56<br>#define PROT_MTE 0x20	/* Taken from arm Linux c=
ommit df9d7a22dd21c926e8175ccc6e176cb45fc7cb09 */<br><br>int main(int argc,=
 char** argv) {<br>	uintptr_t m =3D (uintptr_t)mmap(NULL, 16, PROT_MTE | PR=
OT_READ | PROT_WRITE, <br>			MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);<br><br>	if=
(!m) {<br>		printf(&quot;mmap failed\n&quot;);<br>		exit(1);<br>	}<br><br>	=
uintptr_t tagged_addr =3D m | (1ul &lt;&lt; ADDRESS_TAG_START);<br><br>	asm=
(&quot;stg %[tag], [%[addr]]&quot;<br>		:<br>		: [tag] &quot;r&quot;(tagged=
_addr), [addr] &quot;r&quot;(m)<br>		:<br>	);<br><br>	printf(&quot;Tag comp=
leted\n&quot;);<br>	return 0;<br>}</div><div><br>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Derrick McKee<br=
>Phone: (703) 957-9362<br>Email: <a href=3D"mailto:derrick.mckee@gmail.com"=
 target=3D"_blank">derrick.mckee@gmail.com</a><br></div></div></div>

--00000000000004888605aef6e599--


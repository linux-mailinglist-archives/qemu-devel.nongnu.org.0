Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008C50BF4D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:03:50 +0200 (CEST)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxdF-0008Id-7t
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nhwq0-0002tu-HM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:12:56 -0400
Received: from relay.yourmailgateway.de ([188.68.63.165]:35549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nhwpr-0001gs-Li
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:12:53 -0400
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4KlLZG6bXFz3nWV;
 Fri, 22 Apr 2022 19:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1650647558; bh=mt0AbkpKCYeStUEmJqRhEcP0cNJpJ1Y9/eznqXsSUCE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NnObEP6yws/3BSCNTpVW1lWZYTNHraUSHrngM4343rqt3EigGdpwWQcs0ouv/Pb6q
 0Ft8fa1WC8fjoXy03TyAmpxuMea68QUMMT6tkOtZYJHhClJr4ZIh7g7U6TmemHX1ex
 hTJU6eWtCzgAvYix4vemSywJ8+3WFi5OousIKX3mGCG8BHVy7GgPUFYKS9vdgW0LO3
 hqa7Ra5I+OgAFL2Y+c9/NWcgKJhJ9plTheYBh5Fjq7ouKJlMBQaXAQ49VYv0ZjrkK9
 1IsT6w5eKa/fUTo0AtDMwOvwM7U3Ez6eEYkgSNziXhCNYdpfa4LybYmEZWIxXI+HgM
 s7JqDoVYgenRA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4KlLZG6B6Gz3nWR;
 Fri, 22 Apr 2022 19:12:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KlLZF04j2z8sk5;
 Fri, 22 Apr 2022 19:12:36 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-176.um35.pools.vodafone-ip.de
 [95.223.70.176])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 22C7968209;
 Fri, 22 Apr 2022 19:12:36 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.176) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <ab7e361e-ae71-ebfb-8604-9ddbd67075df@zapateado.de>
Date: Fri, 22 Apr 2022 19:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
References: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
 <CAJ+F1CLuCGTequPCD8ZK08bu3zdo6rdN1UBNX7AXO-s16fVQog@mail.gmail.com>
 <CAPMcbCqP8zkpHX9Zg8Y4v1AdOSGb5seiuCYqt5S4HhZpe8SE8Q@mail.gmail.com>
 <CAJ+F1C+uQUjSvndrwNbHv354Qt4BCUB4hDZyNerNfD7pc_fdiw@mail.gmail.com>
From: Helge Konetzka <hk@zapateado.de>
In-Reply-To: <CAJ+F1C+uQUjSvndrwNbHv354Qt4BCUB4hDZyNerNfD7pc_fdiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <165064755657.19004.18035320093037904450@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: zOr0jByuaPEX+ptsZP7iVXiXgs/OZxoVzukiV5HOBb2J
Received-SPF: pass client-ip=188.68.63.165; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

a few moments ago I sent a PR to Msys2 to make widl work as expected.

I've prepared a rather simple patch to activate the generation of 
qga-vss.tlb by widl in targets all and qemu-ga, which I will post later on.

Thank you for your patience and your help!

Regards, Helge.


Am 20.04.22 um 14:27 schrieb Marc-André Lureau:
> Hi
> 
> On Wed, Apr 20, 2022 at 3:17 PM Konstantin Kostiuk <kkostiuk@redhat.com 
> <mailto:kkostiuk@redhat.com>> wrote:
> 
>     Hi Helge,
> 
>     I checked what happened in MSYS2 and this looks like a bug in the
>     widl tool.
> 
>     I looked into the widl source code and think that it detects the
>     default include path incorrectly.
> 
>     During build of widl tool the corresponding variable receive
>     incorrect value:
>     `BIN_TO_INCLUDEDIR = ../x86_64-w64-mingw32/include` but should be
>     `BIN_TO_INCLUDEDIR = ../include`. Looks like a package mismatch,
>     because the `/ming64/x86_64-w64-mingw32` directory exist
>     but contains only few libs and no any include files.
> 
>     So I agreed with Marc-André. I think this bug should be fixed in MSYS2.
>     I think you can report this issue there
>     https://github.com/msys2/MINGW-packages/issues
>     <https://github.com/msys2/MINGW-packages/issues>
> 
> 
> Thanks for the investigation and your comment on the msys2 issue: 
> https://github.com/msys2/MINGW-packages/issues/11520 
> <https://github.com/msys2/MINGW-packages/issues/11520>
> 
>     When I checked the build using cross-compilation from Linux,
>     the widl tool uses proper BIN_TO_INCLUDEDIR.
> 
>     We should add the rule that qga_vss depends on gen_tlb to get this
>     error more visible.
> 
>     Marc-André, what do you think?
> 
> 
> yes, that's what I suggested earlier
> 
> thanks
> 
>     Best Regards,
>     Konstantin Kostiuk.
> 
> 
>     On Mon, Apr 18, 2022 at 11:15 AM Marc-André Lureau
>     <marcandre.lureau@gmail.com <mailto:marcandre.lureau@gmail.com>> wrote:
> 
>         Hi Helge
> 
>         On Sun, Apr 17, 2022 at 6:51 PM Helge Konetzka <hk@zapateado.de
>         <mailto:hk@zapateado.de>> wrote:
> 
>             Generation with widl needs to be triggered explicitly and
>             requires
>             library and include directories containing referenced *.idl
>             and *.tlb
>             as parameters.
> 
> 
>         Ok, that's different issues, it would help to split the patch.
> 
> 
>             Signed-off-by: Helge Konetzka <hk@zapateado.de
>             <mailto:hk@zapateado.de>>
>             ---
> 
>             For tested Msys2 build all referenced resources reside in
>             /<usr>/include.
>             Msys2 provides its flavours in different /<usr> bases.
> 
>             This patch derives the missing include directory path from
>             widl path.
>             Assuming the given widl path is /<usr>/bin/widl, it
>             determines /<usr>
>             as base and appends /<usr>/include as include and library
>             directories
>             to widl command. This way the directory is correct for any Msys2
>             flavour.
>             It makes sure, only existing directories are appended as
>             parameter.
> 
> 
>         I would file a bug to msys2 instead for widl to use the default
>         include directory. Otherwise, every widl user out there needs to
>         be adjusted.
>         (I think it would need a special --with-widl-includedir=DIR,
>         given how msys2 remaps directory)
> 
> 
>             ---
>                qga/vss-win32/meson.build | 11 +++++++++--
>                1 file changed, 9 insertions(+), 2 deletions(-)
> 
>             diff --git a/qga/vss-win32/meson.build
>             b/qga/vss-win32/meson.build
>             index 71c50d0866..51539a582c 100644
>             --- a/qga/vss-win32/meson.build
>             +++ b/qga/vss-win32/meson.build
>             @@ -30,9 +30,16 @@ if midl.found()
>                                          input: 'qga-vss.idl',
>                                          output: 'qga-vss.tlb',
>                                          command: [midl, '@INPUT@',
>             '/tlb', '@OUTPUT@'])
>             -else
>             +elif widl.found()
>             +  widl_cmd = [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
>             +  usr_include =
>             fs.parent(fs.parent(widl.full_path()))/'include'
>             +  if fs.is_dir(usr_include)
>             +    widl_cmd += ['-L', usr_include]
>             +    widl_cmd += ['-I', usr_include]
>             +  endif
>                  gen_tlb = custom_target('gen-tlb',
>                                          input: 'qga-vss.idl',
>                                          output: 'qga-vss.tlb',
>             -                          command: [widl, '-t', '@INPUT@',
>             '-o',
>             '@OUTPUT@'])
>             +                          build_by_default: true,
> 
> 
>         I would make qga_vss depend on gen_tlb instead (so the tlb is
>         always built with the dll)
> 
>         thanks
> 
>         -- 
>         Marc-André Lureau
> 
> 
> 
> -- 
> Marc-André Lureau


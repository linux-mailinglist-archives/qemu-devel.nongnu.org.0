Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1854498847
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:26:45 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC43A-0006xz-RZ
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nC3Ta-00061x-9U
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:49:58 -0500
Received: from [2a00:1450:4864:20::141] (port=35518
 helo=mail-lf1-x141.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nC3TY-00047q-Hb
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:49:57 -0500
Received: by mail-lf1-x141.google.com with SMTP id x11so51577014lfa.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SGHGAORcXTtbktCxG56t9qv+/r4xZrdyMd9hnMUhHiU=;
 b=gq7Sf2pVrEOPCc9I4V2aLtirMeydBm5iGrSCDGp/1iknBE1W0UdtSCYcnGqNthSBgD
 00uMj3654xiAV2v2m/GWN5kBJeeSejkjM+mnvejpkdSN2T2ZegwKj17pBHkYpvS6Tv0q
 IzRIOSyqxMwnBIlEnOdMfW65ElE3SoH2VzevGG1HF931AR+0jPcJwwB3ro0OoMr7Nqok
 Rk7wt3ZKxSHSwpH5g+w9hkMpwgis1eZ1G8fdy6VuTVeu676OE+AvVcmnLsUdM7x95bzN
 LvMICp8CeDo0B7QFik6n0sNdSyD0DX/DLtZMQL/2bTQYTab4SeFE7x8Oq4bEkJc7Ttyr
 3UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SGHGAORcXTtbktCxG56t9qv+/r4xZrdyMd9hnMUhHiU=;
 b=BiyXnV/Krza6n+xxJwuJtcS2KskqpIzbcZj1XlLSAkVsJLYe80f7NTZKpNyCcsH4hc
 6cVT/H+BojdJuMtZXng8ddU+jrqhhxeGuAqKqfI9DHP2AIOBiZrfXc+Okt40vnnQQAHt
 hLOo9rJI0IkR7+REk5TisNzQ42coZSpevZZeIN5xXgMh5PCwmLd+Pvjz8ssPRPiCL2YE
 48OXwp0Td7uaq7eu4zAGOX7rHIS80mlYPgiUV+wExeaNqhhLhwhPGjIdnHkwppDgs7qT
 fyekkqhWK5teJWAVVYTM+gehgFsUB1U3hKUsXSX5cdz6UE8ItD6IdUN5PSdSYlDRXg9u
 TKDw==
X-Gm-Message-State: AOAM531Sg9dRLpIM86zI6N9bsnS+BgBdlVcmkpHX4/NLkoiqK5sQPJig
 uL5zEHjGAwbCgf8iDoYmidV95w==
X-Google-Smtp-Source: ABdhPJyQwl07BZnRXUJR+caKrpwSP9RL7tPQ/HZ1fbYGvwtOkHRjCo520PVLypWfaZ4LYEAs8Dv6EQ==
X-Received: by 2002:a05:6512:3090:: with SMTP id
 z16mr5251293lfd.601.1643046594704; 
 Mon, 24 Jan 2022 09:49:54 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id o3sm954289ljm.7.2022.01.24.09.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:49:54 -0800 (PST)
Date: Mon, 24 Jan 2022 20:49:53 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Message-ID: <Ye7mwcl/rB714vgl@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev> <7053351.4JHWUSIRgT@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7053351.4JHWUSIRgT@silver>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::141
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::141;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x141.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, eblake@redhat.com,
 jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 dirty@apple.com, armbru@redhat.com, r.bolshakov@yadro.com, agraf@csgraf.de,
 kraxel@redhat.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 alex.bennee@linaro.org, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 12:27:40PM +0100, Christian Schoenebeck wrote:
> On Montag, 24. Januar 2022 10:56:00 CET Roman Bolshakov wrote:
> > On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
> > >  net/vmnet-bridged.m |  25 +++++++++
> > >  net/vmnet-common.m  |  20 +++++++
> > 
> > It seems the last two files should have .c extension rather than .m.
> 
> I would not do that. Mind cross-compilers, please.
> 

Hi Christian,

Cross-compilers for Apple platforms can be constructed using à la carte
approach where toolchain comes from the source, SDK from Apple and a
port of cctools from GitHub (mind all library dependencies of QEMU).
That's quite an effort!

I very much doubt this is a relevant and typical case for QEMU on macOS.
And if cross-compiler is constructed properly it'll pass required flags
that enable blocks and will link block runtime in its default build
recipe like all cross-compilers do for the platform of interest.

Gladly, there's osxcross [1] and crossbuild image with Darwin support [2].
They can deal with blocks just fine:

  # CROSS_TRIPLE=i386-apple-darwin
  $ cc block.c && file a.out
  a.out: Mach-O i386 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|NO_HEAP_EXECUTION>

  # CROSS_TRIPLE=x86_64-apple-darwin
  $ cc block.c && file a.out
  $ file a.out
  a.out: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE>

> > Unlike Cocoa UI code, the files do not contain Objective-C classes. They are
> > just C code with blocks (which is supported by compilers shipped with Xcode
> > SDK), e.g this program can be compiled without extra compiler flags:
> > 
> > $ cat block.c
> > int main() {
> >         int (^x)(void) = ^{
> >                 return 0;
> >         };
> > 
> >         return x();
> > }
> > $ cc block.c && ./a.out
> > $
> > 
> 
> Such blocks are still Objective-C language specific, they are not C and 
> therefore won't work with GCC.
> 

I'm not sure why blocks are Objective-C specific. All the data I have
shows the opposite [3][4][5]. They're just extensively used in Apple APIs.

> $ gcc block.c
> 
> block.c: In function ‘main’:
> block.c:2:14: error: expected identifier or ‘(’ before ‘^’ token
>          int (^x)(void) = ^{
>               ^
> block.c:6:16: warning: implicit declaration of function ‘x’ [-Wimplicit-
> function-declaration]
>          return x();
>                 ^

You might do this on Linux and it'll work:

$ clang -g -fblocks -lBlocksRuntime block.c && ./a.out

However, vmnet code won't be compiled on non-Apple platforms because the
compilation happens only if vmnet is available which happens only if
appleframeworks dependency is available, that is not available on
non-OSX hosts [6]:

  "These dependencies can never be found for non-OSX hosts."

1. https://github.com/tpoechtrager/osxcross
2. https://github.com/multiarch/crossbuild
3. http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1370.pdf
4. https://clang.llvm.org/docs/BlockLanguageSpec.html
5. https://clang.llvm.org/docs/Block-ABI-Apple.html
6. https://mesonbuild.com/Dependencies.html#appleframeworks

Regards,
Roman


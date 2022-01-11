Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A048AE44
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:16:24 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7H0i-0004mt-1O
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n7Gcb-0000wT-PC; Tue, 11 Jan 2022 07:51:30 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n7GcW-0003pz-Rq; Tue, 11 Jan 2022 07:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yEw9eHT27SnjGR8S8BOmyUMfpxMpGFc+nuUp2lzdPvg=; b=wRzj0qFWMvuFbLR6HqpbfrQat8
 VeLYZxY9FoPvDEI945fp/F3zf0rf9vyIZJfmPKbzY61AHqehFvquuWwTKIDlicWUgyDpufwPEq0ZQ
 IRo0OhgiJHh3ASYOpo21OPH6fVFQVUPNoxOvtaCFBYAjy59i9gfLZ+ls0hl5Bp5aj1FnwVG7LY0vk
 FJY0TVA+Kj9IBFEvlewD2CTmX3hhrfjWunzDREj42NLnAvSsYnWrAi066XnMnc/QymwCelrtNFmK1
 bacD0QQ5dkLmfk5jq8CqRI6m7hCgLxR+W4hmRzNITbBJPGXH+GNBh7Ub0o5XzT80YAR4nNJg3XZBh
 XuzzetD3erCdLTlgMiHqfvcMcQLejunPy/EhXeYTy3Y8Q6c/QrziI4qi00Q3zUBS2BzS0o56QfkOS
 Xhx55ic43dtCuaIqPGllF8n6vX5QYobHOGce7JTFIgmhTP6U18xM//GFJQSHiCM84KKAQPZW5K5fI
 S2M1xlyJC6QMu8Ut68ccjTwvAY6RICAZLOgp8BSAmyF9u1A7pPrhMqvqYNgGfVfJOdHYtfb7FS3mB
 OUIXFGL9JnOw1voxNR4fJExtfdwXc+CMVbIOhnbMSojeqt7YQl6Cm0khzByBeMzLKU7rNWdYoGyZk
 T/dm8AwReMfcmkz0Bbd+Pfxh049+3h//BBv47eHU8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Date: Tue, 11 Jan 2022 13:51:20 +0100
Message-ID: <1722520.7uOPACjRs4@silver>
In-Reply-To: <5803228.I1kPANlMEi@silver>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <2141936.zTEnKHbCo3@silver> <5803228.I1kPANlMEi@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 11. Januar 2022 13:35:05 CET Christian Schoenebeck wrote:
> Curiousity was stronger: the original clang behaviour was as I explained:
> https://github.com/llvm-mirror/clang/commit/0a0d2b179085a52c10402feebeb6db8b
> 4d96a140#diff-97c4322e86bf436b7f79f4fcafc4b7beb092da08c5c23f294f98b5bb0a7f9a
> 31
> 
> Quote:
> 
> "
> For example,
> 
>   void foo()
>  
> __attribute__((availability(macosx,introduced=10.2,deprecated=10.4,obsolete
> d=10.6)));
> 
> ...
> 
>    - If we choose a deployment target >= Mac OS X 10.4, uses of "foo"
>     will result in a deprecation warning, as if we had placed
>     attribute((deprecated)) on it ...
> "
> 
> Relevant code section (in that original commit):
> 
> static AvailabilityResult CheckAvailability(ASTContext &Context,
>                                             const AvailabilityAttr *A,
>                                             std::string *Message) {
>   ...
>   VersionTuple TargetMinVersion = Context.Target.getPlatformMinVersion();
>   ...
>   // Make sure that this declaration hasn't been deprecated.
>   if (!A->getDeprecated().empty() && TargetMinVersion >= A->getDeprecated())

Stupid me, you are right. No deprecated warning unless minimum deployment 
target is >= the attribute's deprecated version.

So it was always like this. My bad. :)

> { if (Message) {
>       Message->clear();
>       llvm::raw_string_ostream Out(*Message);
>       Out << "first deprecated in " << PrettyPlatformName << ' '
>           << A->getDeprecated();
>     }
> 
>     return AR_Deprecated;
>   }
>   ...
> }

Best regards,
Christian Schoenebeck




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4DA48A1A6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:16:34 +0100 (CET)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n721p-00060f-LJ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n71rg-00085u-Q7; Mon, 10 Jan 2022 16:06:05 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:55909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n71rR-0004gZ-7u; Mon, 10 Jan 2022 16:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=g2PUeeGWAEo6vvN3L2+XbRFh0G5twa07WR/k8KwaDwY=; b=a0s1NVBLgeUpXjpNBr5ICaQaNA
 KNjXKxy7E6g4mLoEagJEAAE/xj14+f7raLChhT4+UWt9b5ZcIQh1cz2NmgocuWRwi9e8/8+2t6m1x
 jH1TDUCbZ3JAoeH1r8RKMVFaMc5t8MULroZtIPMteIDDvDlQZRR1gilAyjDlv2PVaeqvnT7Tj7sFU
 9Lknmt/KrWkLykO0IPdq4MgeukRcvwxSMXW8IfT8BCroticXjxbxhn7Dk7rbGsa3AqNsJZo74Bpxu
 OmxTQrDjdgeIfVAYhMBau4HXYCJt2698hAO+YM9JoZiAx4pkuST98/3BxTEtemxx+FNBf3AZe7cWW
 6TefQrRB7h3rCLikL8jTQCsl/BOQrKJeMo98Mpqpp46zpC3VVITtz0FUMiLHXj1rQgRIv7H/Fq7cw
 EU+aIOWgVXQKpOTOdxWd91e/QL7gEuMXNkWUTP694FLmnE9/FL+cOMAHXG4L2udbtWt2k5E2TfO8p
 j3T1J7ULxWm5Hn7WAgo7vnLK0UFPGgz6/xkU03ulSeYP4CpvetLwzfDSoVCwhHihIHjL71YzhsDIf
 HTm5IBvqIqeWvSiPP6f+MXyl6xZk21P6R4lzILoOJRmRlSUIxDU5MDiWX8xRF9A0O9TXsd+W/NeFK
 AwqIyF88msF/HHQ65E8O02SmjRYcaYVEq9Rf8bBCM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Date: Mon, 10 Jan 2022 22:05:43 +0100
Message-ID: <2141936.zTEnKHbCo3@silver>
In-Reply-To: <246f1f6f-3674-e3dc-3a8e-f53795fa58cc@gmail.com>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <5230139.pYjDmQ3FvW@silver> <246f1f6f-3674-e3dc-3a8e-f53795fa58cc@gmail.com>
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

On Montag, 10. Januar 2022 21:39:28 CET Akihiko Odaki wrote:
> On 2022/01/11 5:22, Christian Schoenebeck wrote:
> > On Montag, 10. Januar 2022 20:01:40 CET Akihiko Odaki wrote:
> >> On 2022/01/11 3:46, Christian Schoenebeck wrote:
> >>> On Montag, 10. Januar 2022 19:20:15 CET Akihiko Odaki wrote:
> >>>> On 2022/01/10 22:22, Peter Maydell wrote:
> >>>>> On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
> >>>>> 
> >>>>> <qemu_oss@crudebyte.com> wrote:
> >>>>>> I'd suggest to use:
> >>>>>> 
> >>>>>> #if !defined(MAC_OS_VERSION_12_0) ||
> >>>>>> 
> >>>>>>        (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> >>>>>> 
> >>>>>> #define kAudioObjectPropertyElementMain
> >>>>>> kAudioObjectPropertyElementMaster
> >>>>>> #endif
> >>>>> 
> >>>>> This is also how we do this for existing checks of this sort,
> >>>>> like the one in osdep.h for qemu_thread_jit_execute().
> >>>>> 
> >>>>> -- PMM
> >>>> 
> >>>> If I understand correctly, Many macOS-specific codes already no longer
> >>>> complies with GCC because they depend on modern features GCC doesn't
> >>>> provide. The most problematic construction is block; it is extensively
> >>>> used by Apple's ABI and API and you cannot avoid using it even if you
> >>>> try.
> >>> 
> >>> You mean Obj-C blocks? That's working with GCC for decades. I am not
> >>> aware
> >>> about any recent changes to Obj-C block mechanisms by Apple.
> >>> 
> >>>> Also, note that MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound of
> >>>> the supported version. The lower bound should be preferred here because
> >>>> the usage of the new identifier is applied regardless of the version of
> >>>> the host system. It is in contrary to the usage of
> >>>> MAC_OS_X_VERSION_MAX_ALLOWED in osdep.h where the new interfaces are
> >>>> used only for the newer versions. The lower bound is defined as
> >>>> MAC_OS_X_VERSION_MIN_REQUIRED. Practically there is no difference of
> >>>> the
> >>>> two macros because they have the same value in QEMU and
> >>>> kAudioObjectPropertyElementMain is a constant resolved compile-time,
> >>>> but
> >>>> it is still nice to have the code semantically correct.
> >>> 
> >>> For this particular enum: no, MAC_OS_X_VERSION_MAX_ALLOWED is the
> >>> correct
> >>> one. This is about whether enum kAudioObjectPropertyElementMain is
> >>> defined in the SDK header files. That's all. And the new enum
> >>> kAudioObjectPropertyElementMain is pure refactoring of the enum's old
> >>> name due to social reasons ("Master"). The actual reflected numeric
> >>> value
> >>> and semantic of the enum is unchanged and the resulting binary and
> >>> behaviour are identical.
> >> 
> >> There are a few problems with the usage of MAC_OS_X_VERSION_MAX_ALLOWED:
> >> - The deprecation warning is designed to work with
> >> MAC_OS_X_VERSION_MIN_REQUIRED. You may verify that with:
> >> cc -mmacosx-version-min=12.0 -x c - <<EOF
> >> #include <CoreAudio/CoreAudio.h>
> >> 
> >> int main()
> >> {
> >> 
> >>      int k = kAudioObjectPropertyElementMaster;
> >> 
> >> }
> >> EOF
> > 
> > That's actually interesting. On other projects I definitely saw deprecated
> > warnings before on API declarations that were deprecated at a version
> > higher than the project's minimum deployment target.
> > 
> > Did they change that?
> 
> I don't think so. The behavior is documented at:
> https://clang.llvm.org/docs/AttributeReference.html#availability
> and the example refers to OS X 10.4, 10.6, 10.7. Probably they haven't
> changed the behavior for decades.

The descriptions is very vague. It sais e.g. "If Clang is instructed to 
compile code for macOS 10.6 ...". So it is describing it only via singular 
version per example. We are talking about version ranges however.

> MacOSX.sdk/System/Library/Frameworks/Kernel.framework/Headers/os/availabilit
> y.h says manually defining API_TO_BE_DEPRECATED can alter the behavior so
> that may be the case.
> 
> >> - The programmer must be aware whether it is constant or not.
> >> - The macro tells about the runtime and not the SDK. There is no way to
> >> tell the SDK version and that is why I suggested __is_identifier at the
> >> first place. However, now I'm convinced that
> >> MAC_OS_X_VERSION_MIN_REQUIRED is the better option because of the above
> >> reasons.
> > 
> > If you make it dependent on MAC_OS_X_VERSION_MIN_REQUIRED, people with
> > older SDKs (e.g. Xcode <=13.0) would get a compiler error.
> 
> __is_identifier is the only option if you need a compatibility with the
> older SDKs while specifying a greater version for
> MAC_OS_X_VERSION_MIN_REQUIRED. It also applies to
> MAC_OS_X_VERSION_MAX_ALLOWED; they give the possible runtime versions
> and not the SDK version.

I have never used __is_identifier() for such things. I always used 
MAC_OS_X_VERSION_MIN_REQUIRED and MAC_OS_X_VERSION_MAX_ALLOWED and it was 
always doing the job.

And for symbols: those are automatically weak linked by the compiler if the 
project's minimum deployment target is lower than the introductory version of 
the symbol.

> > You are right about the deprecated warning not being emitted in the
> > example
> > above, currently not sure why, but I still think
> > MAC_OS_X_VERSION_MAX_ALLOWED is the way to go in this case.
> 
> The page and the header file I referred the above would help
> understanding the behavior.

Yeah, I already checked that. It basically translates to:

__attribute__((availability(macosx,introduced=10.0,deprecated=12.0)))

So next I would need to read clang sources how this attribute is implemented 
exactly. Not today. ;-)

Best regards,
Christian Schoenebeck




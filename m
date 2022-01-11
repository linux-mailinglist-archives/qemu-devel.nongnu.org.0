Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68B48ADB3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:37:48 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7GPL-0000uJ-Oo
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:37:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n7GMq-0008P7-GU; Tue, 11 Jan 2022 07:35:12 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n7GMo-0000gK-4C; Tue, 11 Jan 2022 07:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=VDV+vG2IEri+vCdojatf4E0nzwgWAjAb6CQ4L8XHars=; b=q/TnS0X/0p4TzmJLefYAdbSr/R
 FEv33LrJb/Qy9lC5CsbIOAb8SE2RvxukGGpxPy+SJtKAGxRwdzu9mcl7RPLgeeLApCyRabWJwKTpl
 tMX/4kN2hakBu3jkikdC0jpH0IjT7oJjbAmQZIsQj5IEKx2tdes1RNdBufd4hwWV5u/MJcuOQmTYY
 FMZIcDLuvvrTP3cA/Y7/p2jf9lSaSVTestM7XjP3N3kcqblXZzfCJmQPN423MlqHdxOMjzkOKGwrp
 EB1bhwE6A3SfJbnhyNF+8nZqYv85rxyzOcxOXaJxw6Kc38L/oOZmKAK4eglNRXIdFj2CWrZTmNRi5
 n5pfygViiAS63AWCEJf42/A45h3IbUcyMNEtDN8mvR2HPwjXOiYQhVwWRWSjGj+eC7hAxwlxaAR3B
 Buhbkk8j8kGmI38Pmfm9mXz2pQP11a8DW/gEIpZ2ziFKvV2cR15DYG81IEP+v65WZ46P/Szm62FhG
 r1y81w8z3pjEzQ1h8rbK1+L64v4sfz2/WPxgVTagQAMuedq25h81YtybjO1amsXqMR2XsVh9J0Zd0
 eVUjenYqH68MaUf5QMIcsFV3eQfl5nG6jDRufBEYwvAcbHaxwhCj4y06rhe/3Csj2lHW1wCDzKAWx
 BJCmr9DAqci7DUGL/w4S6sqs088vIgr5bGbTJkZwM=;
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
Date: Tue, 11 Jan 2022 13:35:05 +0100
Message-ID: <5803228.I1kPANlMEi@silver>
In-Reply-To: <2141936.zTEnKHbCo3@silver>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <246f1f6f-3674-e3dc-3a8e-f53795fa58cc@gmail.com> <2141936.zTEnKHbCo3@silver>
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

On Montag, 10. Januar 2022 22:05:43 CET Christian Schoenebeck wrote:
> On Montag, 10. Januar 2022 21:39:28 CET Akihiko Odaki wrote:
> > On 2022/01/11 5:22, Christian Schoenebeck wrote:
> > > On Montag, 10. Januar 2022 20:01:40 CET Akihiko Odaki wrote:
> > >> On 2022/01/11 3:46, Christian Schoenebeck wrote:
> > >>> On Montag, 10. Januar 2022 19:20:15 CET Akihiko Odaki wrote:
> > >>>> On 2022/01/10 22:22, Peter Maydell wrote:
> > >>>>> On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
> > >>>>> 
> > >>>>> <qemu_oss@crudebyte.com> wrote:
> > >>>> Also, note that MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound
> > >>>> of
> > >>>> the supported version. The lower bound should be preferred here
> > >>>> because
> > >>>> the usage of the new identifier is applied regardless of the version
> > >>>> of
> > >>>> the host system. It is in contrary to the usage of
> > >>>> MAC_OS_X_VERSION_MAX_ALLOWED in osdep.h where the new interfaces are
> > >>>> used only for the newer versions. The lower bound is defined as
> > >>>> MAC_OS_X_VERSION_MIN_REQUIRED. Practically there is no difference of
> > >>>> the
> > >>>> two macros because they have the same value in QEMU and
> > >>>> kAudioObjectPropertyElementMain is a constant resolved compile-time,
> > >>>> but
> > >>>> it is still nice to have the code semantically correct.
> > >>> 
> > >>> For this particular enum: no, MAC_OS_X_VERSION_MAX_ALLOWED is the
> > >>> correct
> > >>> one. This is about whether enum kAudioObjectPropertyElementMain is
> > >>> defined in the SDK header files. That's all. And the new enum
> > >>> kAudioObjectPropertyElementMain is pure refactoring of the enum's old
> > >>> name due to social reasons ("Master"). The actual reflected numeric
> > >>> value
> > >>> and semantic of the enum is unchanged and the resulting binary and
> > >>> behaviour are identical.
> > >> 
> > >> There are a few problems with the usage of
> > >> MAC_OS_X_VERSION_MAX_ALLOWED:
> > >> - The deprecation warning is designed to work with
> > >> MAC_OS_X_VERSION_MIN_REQUIRED. You may verify that with:
> > >> cc -mmacosx-version-min=12.0 -x c - <<EOF
> > >> #include <CoreAudio/CoreAudio.h>
> > >> 
> > >> int main()
> > >> {
> > >> 
> > >>      int k = kAudioObjectPropertyElementMaster;
> > >> 
> > >> }
> > >> EOF
> > > 
> > > That's actually interesting. On other projects I definitely saw
> > > deprecated
> > > warnings before on API declarations that were deprecated at a version
> > > higher than the project's minimum deployment target.
> > > 
> > > Did they change that?
> > 
> > I don't think so. The behavior is documented at:
> > https://clang.llvm.org/docs/AttributeReference.html#availability
> > and the example refers to OS X 10.4, 10.6, 10.7. Probably they haven't
> > changed the behavior for decades.
> 
> The descriptions is very vague. It sais e.g. "If Clang is instructed to
> compile code for macOS 10.6 ...". So it is describing it only via singular
> version per example. We are talking about version ranges however.
> 
> > MacOSX.sdk/System/Library/Frameworks/Kernel.framework/Headers/os/availabil
> > it y.h says manually defining API_TO_BE_DEPRECATED can alter the behavior
> > so that may be the case.
> > 
> > >> - The programmer must be aware whether it is constant or not.
> > >> - The macro tells about the runtime and not the SDK. There is no way to
> > >> tell the SDK version and that is why I suggested __is_identifier at the
> > >> first place. However, now I'm convinced that
> > >> MAC_OS_X_VERSION_MIN_REQUIRED is the better option because of the above
> > >> reasons.
> > > 
> > > If you make it dependent on MAC_OS_X_VERSION_MIN_REQUIRED, people with
> > > older SDKs (e.g. Xcode <=13.0) would get a compiler error.
> > 
> > __is_identifier is the only option if you need a compatibility with the
> > older SDKs while specifying a greater version for
> > MAC_OS_X_VERSION_MIN_REQUIRED. It also applies to
> > MAC_OS_X_VERSION_MAX_ALLOWED; they give the possible runtime versions
> > and not the SDK version.
> 
> I have never used __is_identifier() for such things. I always used
> MAC_OS_X_VERSION_MIN_REQUIRED and MAC_OS_X_VERSION_MAX_ALLOWED and it was
> always doing the job.
> 
> And for symbols: those are automatically weak linked by the compiler if the
> project's minimum deployment target is lower than the introductory version
> of the symbol.
> 
> > > You are right about the deprecated warning not being emitted in the
> > > example
> > > above, currently not sure why, but I still think
> > > MAC_OS_X_VERSION_MAX_ALLOWED is the way to go in this case.
> > 
> > The page and the header file I referred the above would help
> > understanding the behavior.
> 
> Yeah, I already checked that. It basically translates to:
> 
> __attribute__((availability(macosx,introduced=10.0,deprecated=12.0)))
> 
> So next I would need to read clang sources how this attribute is implemented
> exactly. Not today. ;-)

Curiousity was stronger: the original clang behaviour was as I explained:
https://github.com/llvm-mirror/clang/commit/0a0d2b179085a52c10402feebeb6db8b4d96a140#diff-97c4322e86bf436b7f79f4fcafc4b7beb092da08c5c23f294f98b5bb0a7f9a31

Quote:

"
For example,

  void foo()
  __attribute__((availability(macosx,introduced=10.2,deprecated=10.4,obsoleted=10.6)));

...

   - If we choose a deployment target >= Mac OS X 10.4, uses of "foo"
    will result in a deprecation warning, as if we had placed
    attribute((deprecated)) on it ...
"

Relevant code section (in that original commit):

static AvailabilityResult CheckAvailability(ASTContext &Context,
                                            const AvailabilityAttr *A,
                                            std::string *Message) {
  ...
  VersionTuple TargetMinVersion = Context.Target.getPlatformMinVersion();
  ...
  // Make sure that this declaration hasn't been deprecated.
  if (!A->getDeprecated().empty() && TargetMinVersion >= A->getDeprecated()) {
    if (Message) {
      Message->clear();
      llvm::raw_string_ostream Out(*Message);
      Out << "first deprecated in " << PrettyPlatformName << ' '
          << A->getDeprecated();
    }

    return AR_Deprecated;
  }
  ...
}

Still no idea why it behaves differently now. There were some changes in LLVM
on this, but they seem to deal with other things like partial availability
i.e. for weak linking:
https://github.com/llvm/llvm-project/commit/48c7cc9bc04f595b7b335aeae83df4c0221b6d13

Best regards,
Christian Schoenebeck




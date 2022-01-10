Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF26489FA3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:53:34 +0100 (CET)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6znR-0003nV-9k
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:53:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6zgy-0001yQ-3Y; Mon, 10 Jan 2022 13:46:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6zgp-0007z0-Mj; Mon, 10 Jan 2022 13:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bOXaFaqLJed3IDUSSvzWi+9GfMNrLLJI/xVcZrleYjs=; b=NGENjzntVWtSrxIx7VXubXoSe5
 lc4MWOXwRNuixvhF+F69BQd3MV231oHu6Clnv7uzdyObTM3yqij3tzld1tY/Bo03y07dog2izwU1a
 ynmEjVWAwWXsvH6DW0slZLC9crK4QXBM6U73Iw6Z00ELx6PGvCfk4NZ3cAGbnoETibJ5/oUNILAkj
 ud+mHy++4X3J4kqiaPSlEiAXF4BrguoI8h/bPyRHe4vwhizdOp3CzXiZhYKf6T3ETwUjXTK4XwCjf
 htRQSw04xCuAdhqzRA2syyIYUoFvgdMw6xLTWm8OeG49a+cBg6tow0BL0NgarZC8y8zXqZbT2BmQV
 kXrJ7XV4bv3a4c7pLqAYAJTQBnAwe7GqfXzthIdwNLaK7yxtwvV4LL4KsTleXjiiaTSQ7xaprwVtQ
 YJqmjylB4V5ExUxW753lfskwQfqBaQus5pKP3sTlsFKsj4tu3WmSKpC/SP0ysEzrPGQO+OejSWbu+
 rZ1BbW3ACN0JjvWjzAd4MxtoNYhbP9J/dazaMpv1xtkrIiL52NRJyGQAbbNZzkmtVJtbYRNrtDw5e
 aKqdNdlmV9XltdKuvWz78fLwUdd2jF7zX5z+57EAEkBM6UpZmsqTJqk3bmqGI4vfkutvjSPIdXrAi
 Ula3KIhJAmYlgaYIY6A5mmLuj/z5ZFODlXOAcrSLk=;
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
Date: Mon, 10 Jan 2022 19:46:35 +0100
Message-ID: <2798332.tR5H1UBy9i@silver>
In-Reply-To: <9c016476-6679-5d23-296a-6546930087cd@gmail.com>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <CAFEAcA94iQ_-dkNaQD62qSb_5emY5mq=OvR8jAbDkcW0YwUoeA@mail.gmail.com>
 <9c016476-6679-5d23-296a-6546930087cd@gmail.com>
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

On Montag, 10. Januar 2022 19:20:15 CET Akihiko Odaki wrote:
> On 2022/01/10 22:22, Peter Maydell wrote:
> > On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
> > 
> > <qemu_oss@crudebyte.com> wrote:
> >> I'd suggest to use:
> >> 
> >> #if !defined(MAC_OS_VERSION_12_0) ||
> >> 
> >>      (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> >> 
> >> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> >> #endif
> > 
> > This is also how we do this for existing checks of this sort,
> > like the one in osdep.h for qemu_thread_jit_execute().
> > 
> > -- PMM
> 
> If I understand correctly, Many macOS-specific codes already no longer
> complies with GCC because they depend on modern features GCC doesn't
> provide. The most problematic construction is block; it is extensively
> used by Apple's ABI and API and you cannot avoid using it even if you try.

You mean Obj-C blocks? That's working with GCC for decades. I am not aware 
about any recent changes to Obj-C block mechanisms by Apple.

> Also, note that MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound of
> the supported version. The lower bound should be preferred here because
> the usage of the new identifier is applied regardless of the version of
> the host system. It is in contrary to the usage of
> MAC_OS_X_VERSION_MAX_ALLOWED in osdep.h where the new interfaces are
> used only for the newer versions. The lower bound is defined as
> MAC_OS_X_VERSION_MIN_REQUIRED. Practically there is no difference of the
> two macros because they have the same value in QEMU and
> kAudioObjectPropertyElementMain is a constant resolved compile-time, but
> it is still nice to have the code semantically correct.

For this particular enum: no, MAC_OS_X_VERSION_MAX_ALLOWED is the correct one. 
This is about whether enum kAudioObjectPropertyElementMain is defined in the 
SDK header files. That's all. And the new enum kAudioObjectPropertyElementMain 
is pure refactoring of the enum's old name due to social reasons ("Master"). 
The actual reflected numeric value and semantic of the enum is unchanged and 
the resulting binary and behaviour are identical.

There are other cases where MAC_OS_X_VERSION_MIN_REQUIRED (a.k.a. "minimum 
deployment target") would be used instead: macOS APIs that might be available 
to only some, but not to the entire macOS version range officially supported 
by the rolled out binary. Did you see any particular case where this is 
incorrectly used in QEMU?

Best regards,
Christian Schoenebeck




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC430C72C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:16:36 +0100 (CET)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zI3-0005Fz-Fx
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6yel-0003by-KD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:36:00 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6yeg-0003Qf-8P
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=wIKT8QxgT+VRbdxQM8Od6wT1CvurFk4RGe9Rf07Jr5Y=; b=jnNaxaUcX5ASFpC0xzYzHh9CKg
 iZnWH/1mS6Hly2+5JjpQWaJo6Pkxu06LsYzsn5u89E6CY180cboqUlVocIxV8E6AR++YENgK//2dC
 JY/RTB6iPKIz8UA2KCrMuH/XgN708VZUpcuo+pu/xPv0rQ8qzwtjVbiYc0fgNAHTVL6fUVuXJWuzG
 L2ZoyYH4wtsztCyZxS2KuYnok1zDlcHTdQ1M0VC4OLIP2U4IXYZi7MO6CPepIy/LraOCL0EBwMcqA
 UrWesLGXXuxBpSzOJzt+V+jhzHtjwfD8ULAS0hlIQCfETp9KpXfurx2P50isFQFLHolOzkzTgmy0o
 y+zGtgpqUlRFpTZLdbPn6uire6oQ2TLJvwm6b721YUU5t1JLKRNgSdmPrZIY5TNtGjSP2R7xQg5H5
 C+A6PBh4MSpLqb8wiM/OGJ0qsMtFaizOpBOsS8rjBZQI9St6tGBqJJncYYftiPLSc2izLPAfywHHM
 ETgeGIUg23bFZc4Dv8cvdoiDgoiWE2DfUJEKvWG8GYSUNQIO8YGuEqdDcPYFzat1BMGOenXbkHkS4
 TJjw0CJP0057Sh4IJUN1pHLJf0ffIfoBO/0/hdDEjcQcDvZaxIUHwLf7iDQ7mGFCu8uvXG7IfSAKf
 yu9AVyXwbKE9S0lj9h0UccoFcbGrxXMshvQCAD3UM=;
To: qemu-devel@nongnu.org
Subject: Re: macOS (Big Sur,
 Apple Silicon) 'make check' fails in test-crypto-tlscredsx509
Date: Tue, 02 Feb 2021 17:35:49 +0100
Message-ID: <4581723.kQ5iP5sz2Z@silver>
In-Reply-To: <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

On Dienstag, 2. Februar 2021 15:50:24 CET Eric Blake wrote:
> > If the program is compiled with -O0/O1 it returns zero exit code.
> > Here's the output:
> > IO
> > func1:16 foo: 0x0 counter 10
> > func2:4 foo: 0xa
> > good
> > 
> > If it is compiled with -O2 it returns 1:
> > IO
> > func1:16 foo: 0x0 counter 10
> > func2:4 foo: 0xa
> > func2:6 foo: 0x0
> 
> And this proves the point that the compiler was able to exploit the
> undefined behavior in your program.
> 
> > broken
> > 
> > That happens because clang uses register behind foo from func1 (it has
> > zero
> > pointer) inside inlined func2 (it should have non zero pointer).
> > 
> > So, immediate workaround would be to downgrade optimization level of
> > libtasn1 to -O1 in homebrew.
> > 
> > I've submitted the issue to Apple bugtracker:
> > FB8986815
> 
> Yes, it's annoying that as compilers get smarter, it exposes the
> presence of unspecified code in weird ways.  But I don't see this as a
> bug in clang, but as a bug in libtasn1 for assuming undefined behavior
> produces a sane result.

You are right Eric, but nevertheless it's a very aggressive behaviour change 
being introduced way too silent, especially regarding backward compatibility 
like this case proofs.

Personally I find the new semantic NULL + n == NULL makes sense, as it adds 
safety, but I do consider it a bug that clang did not even throw a warning. 
Even when I add -Wnull-pointer-arithmetic it does not complain to me at all.

Best regards,
Christian Schoenebeck




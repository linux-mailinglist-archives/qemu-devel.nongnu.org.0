Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16351DF8FE
	for <lists+qemu-devel@lfdr.de>; Sat, 23 May 2020 19:21:35 +0200 (CEST)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcXq3-0004yJ-1P
	for lists+qemu-devel@lfdr.de; Sat, 23 May 2020 13:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1jcXop-0004Gi-1g
 for qemu-devel@nongnu.org; Sat, 23 May 2020 13:20:19 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:33118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1jcXoo-0006Pu-Bs
 for qemu-devel@nongnu.org; Sat, 23 May 2020 13:20:18 -0400
Received: by mail-qk1-x744.google.com with SMTP id z80so13979046qka.0
 for <qemu-devel@nongnu.org>; Sat, 23 May 2020 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zTTe+4iH7QAWhApn42JtO+pBDt1nUnUTCzGeLteD4lQ=;
 b=G/4oN4WGBodNAmSilCQbEMDEaxOzSsPVRdRpzPj9RGDvfcLBwg+fDqfDh62uPom7mv
 4m4njeo2SCi3VTZQRlF90TfJolsLJFilutufjyJvlVpsYvvdtVqrD2GoUvChD2lM79vU
 9Uct/8SmXE0wWOuNWwCjBLHkR4VlSz9W7ez7LT1ltUmjQZkQgyAIllHxbiEwogPBxI3c
 z/ZhiNFyl9EiBN975HxEEDkwR66eY22ZNmy8tChkqT7DeXAa/IV4j640JzZq01/dOv52
 ZMptof3Oo91hnPlcCWgZDTZgP/ETkbScMwks60VrpUyBYiOwswreaTiqNER/Dn4scxC/
 tzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zTTe+4iH7QAWhApn42JtO+pBDt1nUnUTCzGeLteD4lQ=;
 b=fCNgG/ciEQnBFOMP4u2XCDeg0y6O7J2PVg70bbMIyA4TpgiUIAsHk4pNLC4Tb6kOca
 FxOtPLjeG/PxrdQL26euRo9Bp4PoDkLVxrHN6+J0B4En3gQGTqTErWW0LbLo+xQ9vurH
 03TBb8UgDpozqCpgfDjmVdzBq01WlGDbmzIN0hA5mrLGOB8TFKGPj7wDny62ZJLgimvQ
 U4Foupo0ZnLw6ToXlzIlBUIB9Bg8j2dPe2Jxo17fjmvn5wzHn15wskYfWi7K6LhkkOsj
 0J6xwaBt+W099uklb88ReMGGlsyz9y+moNFW4nTPGhkUlJYDXOsQZiKWxg939fDQjQ7p
 wozg==
X-Gm-Message-State: AOAM5330g/9sQ/HtRcsLzL6HIdJUWuXmRh1TkomnMhUKu5FtKaaS8P0Y
 XEkK01vdktcvZcG+r39Ljbq6+auFb+o=
X-Google-Smtp-Source: ABdhPJx7Hq2zmHgoKlKYFqB6PuJZw1lZaNiKlIs44ye6YQD7q6+DO46XEY2cENsLj6tF0cra6tB1CQ==
X-Received: by 2002:ae9:d844:: with SMTP id u65mr19857895qkf.28.1590254417173; 
 Sat, 23 May 2020 10:20:17 -0700 (PDT)
Received: from localhost ([70.19.54.161])
 by smtp.gmail.com with ESMTPSA id c17sm2466817qtw.48.2020.05.23.10.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 10:20:16 -0700 (PDT)
Date: Sat, 23 May 2020 13:20:15 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH 10/19] include/qemu: Added tsan.h for annotations.
Message-ID: <20200523172015.GB382220@sff>
References: <20200522160755.886-1-robert.foley@linaro.org>
 <20200522160755.886-11-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522160755.886-11-robert.foley@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::744;
 envelope-from=cota@braap.org; helo=mail-qk1-x744.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_SOFTFAIL=0.665,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.puhov@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 22, 2020 at 12:07:46 -0400, Robert Foley wrote:
> These annotations will allow us to give tsan
> additional hints.  For example, we can inform
> tsan about reads/writes to ignore to silence certain
> classes of warnings.
> We can also annotate threads so that the proper thread
> naming shows up in tsan warning results.
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.


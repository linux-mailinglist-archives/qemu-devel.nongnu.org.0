Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F676D44D2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:49:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJbQ-0005ty-2v; Mon, 03 Apr 2023 08:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjJbN-0005mo-4j
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:48:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjJbL-0001MV-0W
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:48:00 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h8so116874026ede.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680526077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/MRUrnDv7mJ1/vYYCo+5najSSyEcIQXKlKO6bO/Q+DU=;
 b=rT4xeU9IIBTh3qb/VSx5rykE52yE9E5eV0SAtyWKZeXlssnTNrwq3FAbKDhUpEjKbU
 ali+nBz6QfBqGEmsOrYJJwhP9UcXfL8CWdAayW9pBaNiP8Wj4e49eoC31TPUTBxGZW7k
 TkHe28xpGpsyvT9PfvjsjjMslk7R+FruOPm7ykGA5ni77oO0Kd3XEq61XGDnjSO80X72
 LaQYV74cWsO3lPUgnSNpYiRKpHL7UEmEEbIB67nqcHDV7xDK+tmXP5DotE3H+Z/6MV7P
 /jOgSI3DmgkFo9ig2Y3MWefwB6jDal54asZdMh+3JqBOH8sUcJnBTTht0b4PRBIjKK6b
 yKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680526077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/MRUrnDv7mJ1/vYYCo+5najSSyEcIQXKlKO6bO/Q+DU=;
 b=hgDCfo4mPcjrqTrNkeFSWWnMZxerwzFN4cDSqfm5R92sZZtevJUYlj3RVpIZ2Gj69n
 tMltmbgdnZoo/8uVWzzBs7iTzblgl3TYrnS5qeGn7/ODGDq/sOdrO3eQ7w0NAjbFKDSW
 4Lvd0k9q4RD5ziY+Bahdig530QUNvBbS7snmka+CYlCUN57TfKf6TDJN7pBhX+myZcsf
 dnUxkMRvWAnwcL4HGVNhHD8R+nLvut+8b6+vBnZvg0xF6FojPII1HYSlmyW63Tmemx8x
 DpifCsxqvR7m+fJqHj4V0vQ5EltOMaKWxt20mX25//UiRBwXf6KJvVyD5qYa3/3feZ/Q
 XhNQ==
X-Gm-Message-State: AAQBX9djoLNME7cUdCJf00jGq6OgAIlBF7s99BPRz/n7sGM6lx7laZNQ
 mrpPaVw6zVYrKfLmMIHmJVYn4yQyNe9HjJUhDgJngw==
X-Google-Smtp-Source: AKy350bsh5TwKhTmymSp+dUIzl3qCWWfNS+NiFVGTLXpJ2+F5gjFuRoLKR1JwoCOWB+5HrisYKbGwgQADL4F74xFnb4=
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr18892343ejt.6.1680526076893; Mon, 03 Apr
 2023 05:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <87h6vxo4em.fsf@pond.sub.org>
In-Reply-To: <87h6vxo4em.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Apr 2023 13:47:46 +0100
Message-ID: <CAFEAcA-+87o7L5oCZY18p63g=7QaEozUdz87thU5t1V3-Rfxew@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023 at 15:56, Markus Armbruster <armbru@redhat.com> wrote:
> > (3) what should we do about the HMP StatusInfo object?
> >     I'm not sure how we handle compatibility for HMP.
>
> Uh, you mean *QMP*, don't you?

Yes.

> As you wrote above, StatusInfo is returned by query-status, which is a
> stable interface.  Changes to members therefore require the usual
> deprecation grace period.  We'd add a new member with a sane name, and
> deprecate the old one.

Question: is it worth creating a new 'one-insn-per-tb' member at all,
or should we instead just make the 'singlestep' member optional and
then stop emitting it (and as a corollary stop reporting it in
HMP 'info status')? It seems kind of weird that we surface this
specific slightly esoteric accelerator property and only this one
in the StatusInfo struct.

-- PMM


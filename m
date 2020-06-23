Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806EB204CF8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 10:50:43 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnede-0001rt-GZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 04:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jneb2-00089j-KI
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:48:00 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jneb0-0006xF-S9
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:48:00 -0400
Received: by mail-wm1-x341.google.com with SMTP id q15so543261wmj.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=mx5tIJcJr0uYdWTdkWxZSWshlz8X4CQlEqhhQ3L17N4=;
 b=LRT0GpIiuxg2Pc5UFgYHAq2oOhnM94RjNl9UOaw913/c6QYM8FaHY40kk9indVdc3Y
 6sdGbFCC4Z5Zsms1KmntWKq9N+f8pn0EIBt34C0Li+CG7djebbzLSPVrsPpAjApxT5Ey
 1t5VN2/Yu6lKoLVgoszttqUBbqwzQBp7poHHZ2Mwti5nyBF1SsrDxjROLt7Z6uoowQmd
 Bgxo4AujZw91UGRagAnQ+QG5gQIH9eZzBNjHPWCHGBSOlPblXPwEp4jUP/86qEiTOOK+
 +I1+JQmL/6kzFJYHqtKsqwTqGI9Lad6ANONwVQ+FRlOZfi6jv8WNlQ5pSOoXXbfgS6co
 5Qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=mx5tIJcJr0uYdWTdkWxZSWshlz8X4CQlEqhhQ3L17N4=;
 b=MbptlLgS8v+3knhwTsHkqXCFqd1w/WTNrLeX7pZdHRaVr/Manbh2kTva0YcBjyCL3f
 q6TtpEPjgHsPLPT5vIbc7rKaSvOW8yyp25P1uDE9ETczmVvG7wimlfYgs6kRmr5enIYf
 h76wlI9MR/NMRmY0xngy65Gxh7fKzjcnYVbqDhD6BEr2ep53N6JwtZnoryGSvA7nGkBK
 VOlLp/xloJQEViG+tr2kk3+KYTAfLEeJIFkYDb69JEzfANtewoebIgSJq1D57ZmlItux
 CkTuaVi4S54xRHp+5Iwov7EVeAf/FpIB9VcLD5JLPjVtYwtxL8dItWRwBRw14aLXriFi
 MkrQ==
X-Gm-Message-State: AOAM5306U4bv82hRh4p29PUxaxL/lLZ5i/5NeCD4CwDPZiPECXlEVJFH
 nrIK3SlQ4fjHT8v6QgqVKzjyZQ==
X-Google-Smtp-Source: ABdhPJyRL+mtWdo6DnyzuZvtXaqIZB3LGdQYWrQHDe4D0S7O4Nlp/ZZmgKdYSMDxo52QsQ+axkVL7Q==
X-Received: by 2002:a05:600c:2:: with SMTP id
 g2mr22635240wmc.176.1592902076925; 
 Tue, 23 Jun 2020 01:47:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm2593035wmc.26.2020.06.23.01.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 01:47:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CA0C1FF7E;
 Tue, 23 Jun 2020 09:47:55 +0100 (BST)
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <20200522023440.26261-16-richard.henderson@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 15/25] Rearrange reginfo and memblock buffers
In-reply-to: <20200522023440.26261-16-richard.henderson@linaro.org>
Date: Tue, 23 Jun 2020 09:47:55 +0100
Message-ID: <87y2oe88xw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For send_register_info from master_sigill, do not keep a
> reginfo buffer on the stack.  At the moment, this struct
> is quite large for aarch64.
>
> Put the two reginfo buffers into an array, for the benefit
> of future dumping.  For recv_and_compare_register_info,
> index this array with constants, so it's a simple rename.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
<snip>
> @@ -221,7 +228,6 @@ static RisuResult recv_and_compare_register_info(void=
 *uc)
>      default:
>          abort();
>      }
> -
>      return res;
>  }

nit: stray whitespace change

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE949C41D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:19:02 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCca5-0007ir-AR
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nCcNJ-0004Em-Su
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:05:53 -0500
Received: from [2607:f8b0:4864:20::532] (port=33282
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nCcNH-0005ka-JM
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:05:49 -0500
Received: by mail-pg1-x532.google.com with SMTP id 133so20417412pgb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 23:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cGJpZJ8pH3sD/uoDVQOLg0Ec8DTzJtcDrlTo3ytJf2Q=;
 b=Or39UqnKREdcqXrAvAaVwvnaz4gLXm8RQdjxvdck3y/f+kMGEb333VTVHhPE35Jg3N
 WRh+L+wnUAQXzKFgCOEt+2vuWH22ChPb1+2cgWJWS2xiK7BmC18VeEKvwA8/qfraIm6u
 vtJEqa4PHUMLC4QLyy5lrliRIaryvAUUd5iQtXx0VC4f0AURM4pwSWQSZo5E2ITdnpEH
 BMvkk41M/Jk183IeAosK9snHMWNZNch6X3+aLxvYcpGtQ2qtriGQbX22sBatJHOrIgB9
 PcTk8czp2dUC4XlnaFtlrQIpDfP5qFf+COFhco1zV6XLgcsnufEH62YKum1qwJ5yIlZs
 uo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cGJpZJ8pH3sD/uoDVQOLg0Ec8DTzJtcDrlTo3ytJf2Q=;
 b=Pcsg0Df3RDhyTeB87XakZ+EjpnTxk1QD5Dw0CMQ6pUCWbRe4N1QV/TwnAwKmrZ5li4
 BRCHoY/6PRnoObWarq446Ug9OGAmdnbwbBY231xpzKxYkDIZhD4e/JQvqpZgry5V499C
 A0NigqQfpAIevjR+UEWafBZjCaRNgsSP568UoWVcx93Li0FFTz8WXh2K8iQmS4lgIQ33
 8bG5w636KKtdZvKGCWXrnoHjN6XIsjw6dYSETuq/seObQTucgFSeVjXLzFtbxJe4TlMt
 ybTpGYN6/1yWMLsq1V8O2hR5RLdNmU/eCusPaC39hk77YIuAb+qZukK2bkSFbDLqiNcd
 wmNg==
X-Gm-Message-State: AOAM533svlKZnex3nbdZ38BQkAxOQAUUFXdVnbfIPcHCjiMOOJKzvL9i
 yNRk1eAlcPJCcSm2itIooxa/tA==
X-Google-Smtp-Source: ABdhPJzBfVpIwsQlvQDn7bCeAZ/4xqtxpUh7aD1Yq3H3AWYhxgnacNm0qKktBT2iDaz4Vb2JfOLyRA==
X-Received: by 2002:a65:68d7:: with SMTP id k23mr8363409pgt.596.1643180744910; 
 Tue, 25 Jan 2022 23:05:44 -0800 (PST)
Received: from anisinha-lenovo ([115.96.109.127])
 by smtp.googlemail.com with ESMTPSA id h6sm1106904pfk.110.2022.01.25.23.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:05:44 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 26 Jan 2022 12:35:37 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
In-Reply-To: <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2201261229380.1134355@anisinha-lenovo>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
 <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x532.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 25 Jan 2022, Eric DeVolder wrote:

> Ani,
> Thanks for the feedback! Inline responses below.
> eric
>
> On 1/25/22 04:53, Ani Sinha wrote:
> >
> >
> > > +
> > > +    action = ACTION_BEGIN_CLEAR_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_END_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_SET_RECORD_OFFSET;
> > > +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_EXECUTE_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
> > > +        ERST_EXECUTE_OPERATION_MAGIC);
> >
> > except here, on all cases we have
> > BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> >
> > We should treat the above as special case and simplify the rest of the
> > calls (eliminate repeated common arguments).
>
> OK, I created BUILD_WRITE_ACTION() to replace this occurrence. I've provided
> what this section of code looks like with this and the other below change at
> the end.
>
> I have seen the comment from Michael and you about using inline functions, I
> will respond to that in the other message.
>
> >
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_CHECK_BUSY_STATUS;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
> > > +
> > > +    action = ACTION_GET_COMMAND_STATUS;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_RECORD_IDENTIFIER;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_SET_RECORD_IDENTIFIER;
> > > +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> >
> > This one seems reverted. Should this be
> > BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> >
> > like others?
>
> This is a SET operation, so the data is provided in VALUE register, then
> the ACTION is written to perform the command, ie record the value.
>

Ok I see. makes sense.

> >
> > > +
> > > +    action = ACTION_GET_RECORD_COUNT;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> >
> > BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
> > argument. WE should eliminate this repeated passing of same argument.
>
> The BUILD_READ_REGISTER is always against the VALUE register, as you point
> out,
> so I've s/BUILD_READ_REGISTER/BUILD_READ_VALUE/ and embedded the offset in the
> macro now. You can see this below.
>

> And here is what the main snippet looks like with the above changes (a diff
> is quite messy):
>
>     /*
>      * Macros for use with construction of the action instructions
>      */
> #define BUILD_READ_VALUE(width_in_bits) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_READ_REGISTER, 0, width_in_bits, \
>         bar0 + ERST_VALUE_OFFSET, 0)
>
> #define BUILD_READ_VALUE_VALUE(width_in_bits, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>         bar0 + ERST_VALUE_OFFSET, value)
>
> #define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_WRITE_REGISTER, 0, width_in_bits, \
>         bar0 + reg, value)
>
> #define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>         bar0 + reg, value)
>
> #define BUILD_WRITE_ACTION() \
>     BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action)
>
>     /* Serialization Instruction Entries */
>     action = ACTION_BEGIN_WRITE_OPERATION;
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_BEGIN_READ_OPERATION;
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_BEGIN_CLEAR_OPERATION;
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_END_OPERATION;
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_SET_RECORD_OFFSET;
>     BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_EXECUTE_OPERATION;
>     BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
>         ERST_EXECUTE_OPERATION_MAGIC);
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_CHECK_BUSY_STATUS;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE_VALUE(32, 0x01);
>
>     action = ACTION_GET_COMMAND_STATUS;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(32);
>
>     action = ACTION_GET_RECORD_IDENTIFIER;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
>
>     action = ACTION_SET_RECORD_IDENTIFIER;
>     BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>     BUILD_WRITE_ACTION();
>
>     action = ACTION_GET_RECORD_COUNT;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(32);
>
>     action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>     BUILD_WRITE_ACTION();
>     BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>
>     action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
>
>     action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
>
>     action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(32);
>
>     action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
>
>     /* Serialization Header */

Yes this looks a lot cleaner. Now as Michael suggested, we can convert
them to inline functions and pass a struct with the common params. Maybe
we can use a macro also to make things even more cleaner. Like calling
the inline function from the macro with the common struct. I am trying to
avoid repeated copy-paste code.


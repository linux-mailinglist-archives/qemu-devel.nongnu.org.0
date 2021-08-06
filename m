Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5D3E30D8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:17:34 +0200 (CEST)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC7Dh-0002sC-8o
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78D-0007NH-1c
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC789-0003nm-Me
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHx5EQ/FFVU5weUfWLrmh3eCkUxykGL/S7FafPAYu/8=;
 b=X4pVeACu2fF9V8DkqhoGpUnSyWnDPIaMF11iiCF/dcgjwX6ha1603Us/tZKO1g3QnWI+6a
 oeJceDanlJ7oEflpYQLnx516XmdOV3u2mPSwHlH+uqU7DuI42BGWB0RYVYS9Na6ZzfmgM6
 9XiWk6AiRPx2j4H/7nnDfEHXILSvbOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-8zf4_XwEO6ScMOqM0eHHXA-1; Fri, 06 Aug 2021 17:11:46 -0400
X-MC-Unique: 8zf4_XwEO6ScMOqM0eHHXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9965687D543
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 21:11:45 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 370AF5C1A3;
 Fri,  6 Aug 2021 21:11:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/12] scripts/codeconverter: Update to latest version
Date: Fri,  6 Aug 2021 17:11:18 -0400
Message-Id: <20210806211127.646908-4-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not documenting every single change in the codeconverter
script because most of that code will be deleted once we finish
the QOM code conversion.  This patch updates the script to the
latest version that was used to perform changes in the QOM code.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 .../codeconverter/codeconverter/patching.py   |  18 +-
 .../codeconverter/codeconverter/qom_macros.py | 187 +++++++++++--
 .../codeconverter/qom_type_info.py            | 247 +++++++++++++++++-
 .../codeconverter/codeconverter/regexps.py    |   3 +-
 4 files changed, 405 insertions(+), 50 deletions(-)

diff --git a/scripts/codeconverter/codeconverter/patching.py b/scripts/codeconverter/codeconverter/patching.py
index 9e92505d394..b4f0029f17e 100644
--- a/scripts/codeconverter/codeconverter/patching.py
+++ b/scripts/codeconverter/codeconverter/patching.py
@@ -59,11 +59,11 @@ def name(self) -> str:
     def compiled_re(klass):
         return re.compile(klass.regexp, re.MULTILINE)
 
-    def start(self) -> int:
-        return self.match.start()
+    def start(self, *args) -> int:
+        return self.match.start(*args)
 
-    def end(self) -> int:
-        return self.match.end()
+    def end(self, *args) -> int:
+        return self.match.end(*args)
 
     def line_col(self) -> LineAndColumn:
         return self.file.line_col(self.start())
@@ -114,9 +114,6 @@ def make_patch(self, replacement: str) -> 'Patch':
         """Make patch replacing the content of this match"""
         return Patch(self.start(), self.end(), replacement)
 
-    def make_subpatch(self, start: int, end: int, replacement: str) -> 'Patch':
-        return Patch(self.start() + start, self.start() + end, replacement)
-
     def make_removal_patch(self) -> 'Patch':
         """Make patch removing contents of match completely"""
         return self.make_patch('')
@@ -377,8 +374,8 @@ def scan_for_matches(self, class_names: Optional[List[str]]=None) -> Iterable[Fi
         DBG("class_names: %r", class_names)
         for cn in class_names:
             matches = self.matches_of_type(class_dict[cn])
-            DBG('%d matches found for %s: %s',
-                    len(matches), cn, ' '.join(names(matches)))
+            INFO('%d matches found for %s: %s',
+                 len(matches), cn, ' '.join(names(matches)))
             yield from matches
 
     def apply_patches(self) -> None:
@@ -407,9 +404,6 @@ def show_diff(self) -> None:
             f.flush()
             subprocess.call(['diff', '-u', self.filename, f.name])
 
-    def ref(self):
-        return TypeInfoReference
-
 class FileList(RegexpScanner):
     def __init__(self):
         super().__init__()
diff --git a/scripts/codeconverter/codeconverter/qom_macros.py b/scripts/codeconverter/codeconverter/qom_macros.py
index 2d2f2055a3d..61570620bd8 100644
--- a/scripts/codeconverter/codeconverter/qom_macros.py
+++ b/scripts/codeconverter/codeconverter/qom_macros.py
@@ -112,7 +112,9 @@ class SimpleTypedefMatch(TypedefMatch):
 
 # This doesn't parse the struct definitions completely, it just assumes
 # the closing brackets are going to be in an unindented line:
-RE_FULL_STRUCT = S('struct', SP, M(RE_IDENTIFIER, n='?', name='structname'), SP,
+RE_FULL_STRUCT = S(NAMED('structtype',
+                         'struct', M(SP, NAMED('structname', RE_IDENTIFIER), n='?')),
+                   SP,
                    NAMED('body', r'{\n',
                          # acceptable inside the struct body:
                          # - lines starting with space or tab
@@ -165,6 +167,10 @@ def split_typedef(self) -> Iterator[Patch]:
         yield self.strip_typedef()
         yield self.append(self.make_simple_typedef())
 
+    def add_struct_name(self, structname: str) -> Iterator[Patch]:
+        yield Patch(self.start('structtype'), self.end('structtype'),
+                                 f'struct {structname}')
+
 class StructTypedefSplit(FullStructTypedefMatch):
     """split struct+typedef declaration"""
     def gen_patches(self) -> Iterator[Patch]:
@@ -191,32 +197,42 @@ def gen_patches(self) -> Iterable[Patch]:
                 if self.group('typedef_type') == 'struct '+td.group('structname'):
                     yield td.strip_typedef()
 
+def typedef_used_by_qom(files: FileList, typedef_name: str) -> bool:
+    qom_macros = [TypeCheckMacro, DeclareInstanceChecker, DeclareInterfaceChecker, DeclareClassCheckers, DeclareObjCheckers, DeclareInterfaceCheckers]
+    qom_matches = chain(*(files.matches_of_type(t) for t in qom_macros))
+    in_use = any(RequiredIdentifier('type', typedef_name) in m.required_identifiers()
+                 for m in qom_matches)
+    return in_use
+
 class QOMDuplicatedTypedefs(DuplicatedTypedefs):
     """Delete duplicate typedefs if used by QOM type"""
     def gen_patches(self) -> Iterable[Patch]:
-        qom_macros = [TypeCheckMacro, DeclareInstanceChecker, DeclareClassCheckers, DeclareObjCheckers]
-        qom_matches = chain(*(self.file.matches_of_type(t) for t in qom_macros))
-        in_use = any(RequiredIdentifier('type', self.name) in m.required_identifiers()
-                     for m in qom_matches)
-        if in_use:
+        if typedef_used_by_qom(self.allfiles, self.name):
             yield from DuplicatedTypedefs.gen_patches(self)
 
 class QOMStructTypedefSplit(FullStructTypedefMatch):
     """split struct+typedef declaration if used by QOM type"""
     def gen_patches(self) -> Iterator[Patch]:
-        qom_macros = [TypeCheckMacro, DeclareInstanceChecker, DeclareClassCheckers, DeclareObjCheckers]
-        qom_matches = chain(*(self.file.matches_of_type(t) for t in qom_macros))
-        in_use = any(RequiredIdentifier('type', self.name) in m.required_identifiers()
-                     for m in qom_matches)
-        if in_use:
+        if typedef_used_by_qom(self.allfiles, self.name):
             yield from self.split_typedef()
 
-def typedefs(file: FileInfo) -> Iterable[TypedefMatch]:
-    return (cast(TypedefMatch, m)
-            for m in chain(file.matches_of_type(SimpleTypedefMatch),
-                           file.matches_of_type(FullStructTypedefMatch)))
+class AddNamesToTypedefs(FullStructTypedefMatch):
+    """Add struct names to typedef declaration if used by QOM type"""
+    def gen_patches(self) -> Iterable['Patch']:
+        if self.group('structname'):
+            return
+
+        if not typedef_used_by_qom(self.allfiles, self.name):
+            return
+
+        yield from self.add_struct_name(self.make_structname())
+
+
+def typedefs(file: RegexpScanner) -> Iterable[TypedefMatch]:
+    return chain(file.matches_of_type(SimpleTypedefMatch),
+                 file.matches_of_type(FullStructTypedefMatch))
 
-def find_typedef(f: FileInfo, name: Optional[str]) -> Optional[TypedefMatch]:
+def find_typedef(f: RegexpScanner, name: Optional[str]) -> Optional[TypedefMatch]:
     if not name:
         return None
     for td in typedefs(f):
@@ -280,6 +296,17 @@ def find_matching_macros(self) -> List['TypeCheckMacro']:
                    and (my_ids.uppercase == m.type_identifiers.uppercase
                         or my_ids.typename == m.type_identifiers.typename)]
 
+    def find_conflicting_declarations(self) -> List['TypeCheckerDeclaration']:
+        """Find declarations that conflict with this one"""
+        my_ids = self.type_identifiers
+        assert my_ids
+        uppercase = my_ids.uppercase
+        if uppercase is None:
+            return []
+        matching = list(self.find_matching_macros())
+        other = list(find_type_checkers(self.allfiles, uppercase))
+        return list(o for o in other if not any(m for m in matching if m == o))
+
     def merge_ids(self, matches: List['TypeCheckMacro']) -> Optional[TypeIdentifiers]:
         """Try to merge info about type identifiers from all matches in a list"""
         if not matches:
@@ -361,6 +388,12 @@ def gen_patches(self) -> Iterable[Patch]:
             DBG("skipping %s (will patch when handling %s)", self.name, matches[0].name)
             return
 
+        conflicting = self.find_conflicting_declarations()
+        if conflicting:
+            self.warn("macro %s has conflicting declarations", self.name)
+            for c in conflicting:
+                c.warn("conflict here")
+            return
 
         ids = self.merge_ids(matches)
         if ids is None:
@@ -418,7 +451,11 @@ def gen_patches(self) -> Iterable[Patch]:
                     self.info("typedef %s found in typedefs.h", t)
                     continue
 
-                issues.append("couldn't find typedef %s" % (t))
+                td = find_typedef(self.allfiles, t)
+                if td:
+                    issues.append("typedef %s is defined in another file (%s)" % (t, td.file.filename))
+                else:
+                    issues.append("couldn't find typedef %s" % (t))
             elif td.start() > self.start():
                 issues.append("typedef %s need to be moved earlier in the file" % (td.name))
 
@@ -441,7 +478,7 @@ class InterfaceCheckMacro(FileMatch):
     """
     regexp = S(RE_MACRO_DEFINE,
                'INTERFACE_CHECK',
-               r'\s*\(\s*', OR(NAMED('instancetype', RE_IDENTIFIER), RE_TYPE, name='c_type'),
+               r'\s*\(\s*', NAMED('instancetype', RE_IDENTIFIER),
                r'\s*,', CPP_SPACE,
                OPTIONAL_PARS(RE_IDENTIFIER), r',', CPP_SPACE,
                NAMED('qom_typename', RE_IDENTIFIER), r'\s*\)\n')
@@ -571,6 +608,21 @@ def required_identifiers(self) -> Iterable[RequiredIdentifier]:
         yield RequiredIdentifier('type', self.group('classtype'))
         yield RequiredIdentifier('type', self.group('instancetype'))
 
+class DeclareInterfaceCheckers(TypeCheckerDeclaration):
+    """DECLARE_INTERFACE_CHECKERS use"""
+    regexp = S(r'^[ \t]*DECLARE_INTERFACE_CHECKERS\s*\(\s*',
+               NAMED('instancetype', RE_TYPE), r'\s*,\s*',
+               NAMED('classtype', RE_TYPE), r'\s*,\s*',
+               NAMED('uppercase', RE_IDENTIFIER), r'\s*,\s*',
+               OR(RE_IDENTIFIER, RE_STRING, RE_MACRO_CONCAT, RE_FUN_CALL, name='typename'), SP,
+               r'\)[ \t]*;?[ \t]*\n')
+
+    def required_identifiers(self) -> Iterable[RequiredIdentifier]:
+        yield RequiredIdentifier('include', '"qom/object.h"')
+        yield RequiredIdentifier('constant', self.group('typename'))
+        yield RequiredIdentifier('type', self.group('classtype'))
+        yield RequiredIdentifier('type', self.group('instancetype'))
+
 class TypeDeclarationFixup(FileMatch):
     """Common base class for code that will look at a set of type declarations"""
     regexp = RE_FILE_BEGIN
@@ -581,8 +633,9 @@ def gen_patches(self) -> Iterable[Patch]:
 
         # group checkers by uppercase name:
         decl_types: List[Type[TypeDeclaration]] = [DeclareInstanceChecker, DeclareInstanceType,
+                                                   DeclareInterfaceChecker,
                                                    DeclareClassCheckers, DeclareClassType,
-                                                   DeclareObjCheckers]
+                                                   DeclareObjCheckers, DeclareInterfaceCheckers]
         checker_dict: Dict[str, List[TypeDeclaration]] = {}
         for t in decl_types:
             for m in self.file.matches_of_type(t):
@@ -607,19 +660,19 @@ def find_conflicts(self, uppercase: str, checkers: List[TypeDeclaration]) -> boo
         conflicting: List[FileMatch] = []
         # conflicts in the same file:
         conflicting.extend(chain(self.file.find_matches(DefineDirective, uppercase),
-                                 self.file.find_matches(DeclareInterfaceChecker, uppercase, 'uppercase'),
                                  self.file.find_matches(DeclareClassType, uppercase, 'uppercase'),
                                  self.file.find_matches(DeclareInstanceType, uppercase, 'uppercase')))
 
         # conflicts in another file:
         conflicting.extend(o for o in chain(self.allfiles.find_matches(DeclareInstanceChecker, uppercase, 'uppercase'),
+                                            self.allfiles.find_matches(DeclareInterfaceChecker, uppercase, 'uppercase'),
                                             self.allfiles.find_matches(DeclareClassCheckers, uppercase, 'uppercase'),
                                             self.allfiles.find_matches(DeclareInterfaceChecker, uppercase, 'uppercase'),
                                             self.allfiles.find_matches(DefineDirective, uppercase))
-                           if o is not None and o.file != self.file
+                           if o is not None and o.file.filename != self.file.filename
                                # if both are .c files, there's no conflict at all:
                                and not (o.file.filename.suffix == '.c' and
-                                       self.file.filename.suffix == '.c'))
+                                        self.file.filename.suffix == '.c'))
 
         if conflicting:
             for c in checkers:
@@ -667,6 +720,84 @@ def gen_patches_for_type(self, uppercase: str,
         #    yield c.make_removal_patch()
         #yield last_checker.append(s)
 
+class AddDeclareObjCheckers(TypeDeclarationFixup):
+    """Replace DECLARE_INSTANCE_CHECKER/DECLARE_CLASS_CHECKERS with DECLARE_OBJ_CHECKERS"""
+    regexp = RE_FILE_BEGIN
+    def gen_patches_for_type(self, uppercase: str,
+                             checkers: List[TypeDeclaration],
+                             fields: Dict[str, Optional[str]]) -> Iterable[Patch]:
+        if self.find_conflicts(uppercase, checkers):
+            return
+
+        if not fields.get('instancetype') or not fields.get('classtype'):
+            self.info("skipping %s", uppercase)
+            return
+
+        if any(isinstance(c, DeclareObjCheckers) for c in checkers):
+            self.info("DECLARE_OBJ_CHECKERS already in use for %s", uppercase)
+            return
+
+        _,first_checker = min((m.start(), m) for m in checkers)
+        _,last_checker = max((m.start(), m) for m in checkers)
+
+        assert self.file.original_content
+        macro_re = r'\b'+OR(uppercase, f'{uppercase}_CLASS', f'{uppercase}_GET_CLASS')+r'\b'
+        # make sure the macros are not used between the first declaration and the last one
+        if re.search(macro_re, self.file.original_content[first_checker.end():last_checker.start()]):
+            self.info("macro %s is used", uppercase)
+            return
+
+        for c in checkers:
+            if isinstance(c, DeclareClassCheckers):
+                yield c.make_removal_patch()
+            if isinstance(c, DeclareInstanceChecker):
+                yield c.make_removal_patch()
+
+        s = (f"DECLARE_OBJ_CHECKERS({fields['instancetype']}, {fields['classtype']},\n"+
+             f"                     {fields['uppercase']}, {fields['typename']})\n")
+        yield last_checker.append(s)
+
+
+class AddDeclareInterfaceCheckers(TypeDeclarationFixup):
+    """Replace DECLARE_INTERFACE_CHECKER/DECLARE_CLASS_CHECKERS with DECLARE_INTERFACE_CHECKERS"""
+    regexp = RE_FILE_BEGIN
+    def gen_patches_for_type(self, uppercase: str,
+                             checkers: List[TypeDeclaration],
+                             fields: Dict[str, Optional[str]]) -> Iterable[Patch]:
+        if not any(isinstance(c, DeclareInterfaceChecker) for c in checkers):
+            return
+
+        if self.find_conflicts(uppercase, checkers):
+            return
+
+        if not fields.get('instancetype') or not fields.get('classtype'):
+            self.info("skipping %s", uppercase)
+            return
+
+        if any(isinstance(c, DeclareInterfaceCheckers) for c in checkers):
+            self.info("DECLARE_INTERFACE_CHECKERS already in use for %s", uppercase)
+            return
+
+        _,first_checker = min((m.start(), m) for m in checkers)
+        _,last_checker = max((m.start(), m) for m in checkers)
+
+        assert self.file.original_content
+        macro_re = r'\b'+OR(uppercase, f'{uppercase}_CLASS', f'{uppercase}_GET_CLASS')+r'\b'
+        # make sure the macros are not used between the first declaration and the last one
+        if re.search(macro_re, self.file.original_content[first_checker.end():last_checker.start()]):
+            self.info("macro %s is used", uppercase)
+            return
+
+        for c in checkers:
+            if isinstance(c, DeclareClassCheckers):
+                yield c.make_removal_patch()
+            if isinstance(c, DeclareInterfaceChecker):
+                yield c.make_removal_patch()
+
+        s = (f"DECLARE_INTERFACE_CHECKERS({fields['instancetype']}, {fields['classtype']},\n"+
+             f"                           {fields['uppercase']}, {fields['typename']})\n")
+        yield last_checker.append(s)
+
 
 class AddDeclareTypeName(TypeDeclarationFixup):
     """Add DECLARE_TYPE_NAME declarations if necessary"""
@@ -727,6 +858,14 @@ class ObjectDeclareSimpleType(TypeCheckerDeclaration):
                NAMED('uppercase', RE_IDENTIFIER), SP,
                r'\)[ \t]*;?[ \t]*\n')
 
+class ObjectDeclareInterfaceType(TypeCheckerDeclaration):
+    """OBJECT_DECLARE_INTERFACE_TYPE usage"""
+    regexp = S(r'^[ \t]*OBJECT_DECLARE_INTERFACE_TYPE\s*\(',
+               NAMED('instancetype', RE_TYPE), r'\s*,\s*',
+               NAMED('classtype', RE_TYPE), r'\s*,\s*',
+               NAMED('uppercase', RE_IDENTIFIER), SP,
+               r'\)[ \t]*;?[ \t]*\n')
+
 class OldStyleObjectDeclareSimpleType(TypeCheckerDeclaration):
     """OBJECT_DECLARE_SIMPLE_TYPE usage (old API)"""
     regexp = S(r'^[ \t]*OBJECT_DECLARE_SIMPLE_TYPE\s*\(',
@@ -754,7 +893,8 @@ def find_typename_uppercase(files: FileList, typename: str) -> Optional[str]:
 def find_type_checkers(files:FileList, name:str, group:str='uppercase') -> Iterable[TypeCheckerDeclaration]:
     """Find usage of DECLARE*CHECKER macro"""
     c: Type[TypeCheckerDeclaration]
-    for c in (DeclareInstanceChecker, DeclareClassCheckers, DeclareObjCheckers, ObjectDeclareType, ObjectDeclareSimpleType):
+    for c in (DeclareInstanceChecker, DeclareClassCheckers, DeclareObjCheckers,
+              ObjectDeclareType, ObjectDeclareSimpleType, ObjectDeclareInterfaceType):
         yield from files.find_matches(c, name=name, group=group)
 
 class Include(FileMatch):
@@ -853,7 +993,6 @@ def gen_patches(self) -> Iterator[Patch]:
                 definition.warn("definition of %s %s needs to be moved earlier in the file", i.type, i.name)
                 earliest.warn("definition of %s %s is used here", i.type, i.name)
 
-
 class EmptyPreprocessorConditional(FileMatch):
     """Delete empty preprocessor conditionals"""
     regexp = r'^[ \t]*#(if|ifdef)[ \t].*\n+[ \t]*#endif[ \t]*\n'
diff --git a/scripts/codeconverter/codeconverter/qom_type_info.py b/scripts/codeconverter/codeconverter/qom_type_info.py
index 255cb59923d..1c1834a2daa 100644
--- a/scripts/codeconverter/codeconverter/qom_type_info.py
+++ b/scripts/codeconverter/codeconverter/qom_type_info.py
@@ -12,7 +12,8 @@
 from .qom_macros import *
 
 TI_FIELDS = [ 'name', 'parent', 'abstract', 'interfaces',
-    'instance_size', 'instance_init', 'instance_post_init', 'instance_finalize',
+    'instance_size', 'instance_align',
+    'instance_init', 'instance_post_init', 'instance_finalize',
     'class_size', 'class_init', 'class_base_init', 'class_data']
 
 RE_TI_FIELD_NAME = OR(*TI_FIELDS)
@@ -78,7 +79,7 @@ def uppercase(self) -> Optional[str]:
         return self.group('uppercase')
 
     @property
-    def parent_uppercase(self) -> str:
+    def parent_uppercase(self) -> Optional[str]:
         return self.group('parent_uppercase')
 
     @property
@@ -86,11 +87,11 @@ def initializers(self) -> Optional[TypeInfoInitializers]:
         if getattr(self, '_inititalizers', None):
             self._initializers: TypeInfoInitializers
             return self._initializers
+        d = None
         fields = self.group('fields')
-        if fields is None:
-            return None
-        d = dict((fm.group('field'), fm)
-                  for fm in self.group_finditer(FieldInitializer, 'fields'))
+        if fields:
+            d = dict((fm.group('field'), fm)
+                      for fm in self.group_finditer(FieldInitializer, 'fields'))
         self._initializers = d # type: ignore
         return self._initializers
 
@@ -138,6 +139,15 @@ def uppercase(self) -> Optional[str]:
             return None
         return typename[len('TYPE_'):]
 
+    @property
+    def parent_uppercase(self) -> Optional[str]:
+        typename = self.get_raw_initializer_value('parent')
+        if not typename:
+            return None
+        if not typename.startswith('TYPE_'):
+            return None
+        return typename[len('TYPE_'):]
+
     @property
     def classtype(self) -> Optional[str]:
         class_size = self.get_raw_initializer_value('class_size')
@@ -343,6 +353,13 @@ def gen_patches(self) -> Iterable[Patch]:
 
         ok = True
 
+        if is_interface_type(self):
+            decl = self.allfiles.find_match(ObjectDeclareInterfaceType, uppercase, 'uppercase')
+            if decl:
+                instancetype = decl.instancetype
+            else:
+                self.warn("can't find OBJECT_DECLARE_INTERFACE_TYPE for interface type (%s)", uppercase)
+
         #checkers: List[TypeCheckerDeclaration] = list(find_type_checkers(self.allfiles, uppercase))
         #for c in checkers:
         #    c.info("instance type checker declaration (%s) is here", c.group('uppercase'))
@@ -449,9 +466,9 @@ class ObjectDefineType(TypeDefinition):
 
 def find_type_definitions(files: FileList, uppercase: str) -> Iterable[TypeDefinition]:
     types: List[Type[TypeDefinition]] = [TypeInfoVar, ObjectDefineType, ObjectDefineTypeExtended]
-    for t in types:
-        for m in files.matches_of_type(t):
-            m.debug("uppercase: %s", m.uppercase)
+    #for t in types:
+    #    for m in files.matches_of_type(t):
+    #        m.debug("uppercase: %s", m.uppercase)
     yield from (m for t in types
                   for m in files.matches_of_type(t)
                 if m.uppercase == uppercase)
@@ -554,7 +571,7 @@ def gen_patches(self) -> Iterable[Patch]:
             if not self.file.force:
                 return
 
-        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers]
+        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers, DeclareInterfaceCheckers]
         class_decls = [m for t in decl_types
                        for m in self.allfiles.find_matches(t, uppercase, 'uppercase')]
 
@@ -600,8 +617,90 @@ def gen_patches(self) -> Iterable[Patch]:
         c = (f'OBJECT_DECLARE_TYPE({instancetype}, {classtype}, {uppercase})\n')
         yield self.make_patch(c)
 
+class AddObjectDeclareInterface(DeclareInterfaceCheckers):
+    """Will add OBJECT_DECLARE_INTERFACE(...) if possible"""
+    def gen_patches(self) -> Iterable[Patch]:
+        uppercase = self.uppercase
+        typename = self.group('typename')
+        instancetype = self.group('instancetype')
+        classtype = self.group('classtype')
+
+        if typename != f'TYPE_{uppercase}':
+            self.warn("type name mismatch: %s vs %s", typename, uppercase)
+            return
+
+        typedefs = [(t,self.allfiles.find_matches(SimpleTypedefMatch, t))
+                    for t in (instancetype, classtype)]
+        for t,tds in typedefs:
+            if not tds:
+                self.warn("typedef %s not found", t)
+                return
+            for td in tds:
+                td_type = td.group('typedef_type')
+                if td_type != f'struct {t}':
+                    self.warn("typedef mismatch: %s is defined as %s", t, td_type)
+                    td.warn("typedef is here")
+                    return
+
+        # look for reuse of same struct type
+        other_instance_checkers = [c for c in find_type_checkers(self.allfiles, instancetype, 'instancetype')
+                                if c.uppercase != uppercase]
+        if other_instance_checkers:
+            self.warn("typedef %s is being reused", instancetype)
+            for ic in other_instance_checkers:
+                ic.warn("%s is reused here", instancetype)
+            if not self.file.force:
+                return
+
+        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers, DeclareInterfaceCheckers]
+        class_decls = [m for t in decl_types
+                       for m in self.allfiles.find_matches(t, uppercase, 'uppercase')]
+
+        defs = list(find_type_definitions(self.allfiles, uppercase))
+        if len(defs) > 1:
+            self.warn("multiple definitions for %s", uppercase)
+            for d in defs:
+                d.warn("definition found here")
+            if not self.file.force:
+                return
+        elif len(defs) == 0:
+            self.warn("type definition for %s not found", uppercase)
+            if not self.file.force:
+                return
+        else:
+            d = defs[0]
+            if d.instancetype and d.instancetype != 'void':
+                self.warn("instance type shouldn't be set for interface type %s (%s)", uppercase, instancetype)
+                d.warn("instance type declared here (%s)", d.instancetype)
+                if not self.file.force:
+                    return
+            if d.classtype != classtype:
+                self.warn("mismatching class type for %s (%s)", uppercase, classtype)
+                d.warn("class type declared here (%s)", d.classtype)
+                if not self.file.force:
+                    return
+
+        assert self.file.original_content
+        for t,tds in typedefs:
+            assert tds
+            for td in tds:
+                if td.file is not self.file:
+                    continue
+
+                # delete typedefs that are truly redundant:
+                # 1) defined after DECLARE_INTERFACE_CHECKERS
+                if td.start() > self.start():
+                    yield td.make_removal_patch()
+                # 2) defined before DECLARE_INTERFACE_CHECKERS, but unused
+                elif not re.search(r'\b'+t+r'\b', self.file.original_content[td.end():self.start()]):
+                    yield td.make_removal_patch()
+
+        c = (f'OBJECT_DECLARE_INTERFACE({instancetype}, {classtype}, {uppercase})\n')
+        yield self.make_patch(c)
+
+
 class AddObjectDeclareSimpleType(DeclareInstanceChecker):
-    """Will add OBJECT_DECLARE_SIMPLE_TYPE(...) if possible"""
+    """Convert DECLARE_INSTANCE_CHECKER to OBJECT_DECLARE_SIMPLE_TYPE(...) if possible"""
     def gen_patches(self) -> Iterable[Patch]:
         uppercase = self.uppercase
         typename = self.group('typename')
@@ -634,7 +733,7 @@ def gen_patches(self) -> Iterable[Patch]:
             if not self.file.force:
                 return
 
-        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers]
+        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers, DeclareInterfaceCheckers]
         class_decls = [m for t in decl_types
                        for m in self.allfiles.find_matches(t, uppercase, 'uppercase')]
         if class_decls:
@@ -686,6 +785,104 @@ def gen_patches(self) -> Iterable[Patch]:
         yield self.make_patch(c)
 
 
+def is_interface_type(d: TypeDefinition) -> bool:
+    uppercase = d.uppercase
+    while True:
+        if not d.parent_uppercase:
+            return False
+        if d.parent_uppercase == 'INTERFACE':
+            return True
+        parents = list(find_type_definitions(d.allfiles, d.parent_uppercase))
+        if len(parents) != 1:
+            d.warn("type definition for %s (parent of %s) not found",
+                   d.parent_uppercase, uppercase)
+            for p in parents:
+                p.warn("multiple matches found for %s", d.parent_uppercase)
+            return False
+        d = parents[0]
+
+class AddObjectDeclareInterfaceType(DeclareInterfaceCheckers):
+    """Will add OBJECT_DECLARE_INTERFACE_TYPE(...) if possible"""
+    def gen_patches(self) -> Iterable[Patch]:
+        uppercase = self.uppercase
+        typename = self.group('typename')
+        instancetype = self.group('instancetype')
+        classtype = self.group('classtype')
+
+        if typename != f'TYPE_{uppercase}':
+            self.warn("type name mismatch: %s vs %s", typename, uppercase)
+            return
+
+        typedefs = [(t,self.allfiles.find_matches(SimpleTypedefMatch, t))
+                    for t in (instancetype, classtype)]
+        for t,tds in typedefs:
+            if not tds:
+                self.warn("typedef %s not found", t)
+                return
+            for td in tds:
+                td_type = td.group('typedef_type')
+                if td_type != f'struct {t}':
+                    self.warn("typedef mismatch: %s is defined as %s", t, td_type)
+                    td.warn("typedef is here")
+                    return
+
+        # look for reuse of same struct type, just for safety
+        other_instance_checkers = [c for c in find_type_checkers(self.allfiles, instancetype, 'instancetype')
+                                if c.uppercase != uppercase]
+        if other_instance_checkers:
+            self.warn("typedef %s is being reused", instancetype)
+            for ic in other_instance_checkers:
+                ic.warn("%s is reused here", instancetype)
+            if not self.file.force:
+                return
+
+        decl_types: List[Type[TypeDeclaration]] = [DeclareClassCheckers, DeclareObjCheckers]
+        class_decls = [m for t in decl_types
+                       for m in self.allfiles.find_matches(t, uppercase, 'uppercase')]
+
+        defs = list(find_type_definitions(self.allfiles, uppercase))
+        if len(defs) > 1:
+            self.warn("multiple definitions for %s", uppercase)
+            for d in defs:
+                d.warn("definition found here")
+            if not self.file.force:
+                return
+        elif len(defs) == 0:
+            self.warn("type definition for %s not found", uppercase)
+            if not self.file.force:
+                return
+        else:
+            d = defs[0]
+            if not is_interface_type(d):
+                self.info("%s is not declared as interface type")
+                return
+
+            if d.classtype != classtype:
+                self.warn("mismatching class type for %s (%s)", uppercase, classtype)
+                d.warn("class type declared here (%s)", d.classtype)
+                if not self.file.force:
+                    return
+
+        assert self.file.original_content
+        for t,tds in typedefs:
+            assert tds
+            for td in tds:
+                if td.file is not self.file:
+                    continue
+
+                # delete typedefs that are truly redundant:
+                # 1) defined after DECLARE_OBJ_CHECKERS
+                if td.start() > self.start():
+                    yield td.make_removal_patch()
+                # 2) defined before DECLARE_OBJ_CHECKERS, but unused
+                elif not re.search(r'\b'+t+r'\b', self.file.original_content[td.end():self.start()]):
+                    yield td.make_removal_patch()
+
+        c = (f'OBJECT_DECLARE_INTERFACE_TYPE({instancetype}, {classtype},\n'
+             f'                              {uppercase})\n')
+        yield self.make_patch(c)
+
+
 class TypeInfoStringName(TypeInfoVar):
     """Replace hardcoded type names with TYPE_ constant"""
     def gen_patches(self) -> Iterable[Patch]:
@@ -812,10 +1009,12 @@ class DeleteEmptyTypeInitFunc(TypeInitMacro):
     def gen_patches(self) -> Iterable[Patch]:
         fn = self.file.find_match(StaticVoidFunction, self.name)
         DBG("function for %s: %s", self.name, fn)
-        if fn and fn.body == '':
+        if fn and fn.is_empty():
             yield fn.make_patch('')
             yield self.make_patch('')
 
+RE_EMPTY_LINES = r'(\s*\n)*'
+
 class StaticVoidFunction(FileMatch):
     """simple static void function
     (no replacement rules)
@@ -839,6 +1038,9 @@ class StaticVoidFunction(FileMatch):
     def body(self) -> str:
         return self.group('body')
 
+    def is_empty(self) -> bool:
+        return bool(re.fullmatch(RE_EMPTY_LINES, self.body, re.MULTILINE))
+
     def has_preprocessor_directive(self) -> bool:
         return bool(re.search(r'^[ \t]*#', self.body, re.MULTILINE))
 
@@ -959,6 +1161,25 @@ def gen_patches(self) -> Iterable[Patch]:
         #     f'                           MODULE_OBJ_NAME, ParentClassType)\n')
         #yield self.make_patch(c)
 
+class SetInstanceSizeInterfaces(TypeInfoVar):
+    """Set instance type for interface TypeInfo variables"""
+    def gen_patches(self) -> Iterable[Patch]:
+        if not is_interface_type(self):
+            return
+        if 'instance_size' in self.get_initializers():
+            return
+
+        uppercase = self.uppercase
+        if not uppercase:
+            self.info("no uppercase name")
+            return
+
+        decl = self.allfiles.find_match(ObjectDeclareInterfaceType, uppercase, 'uppercase')
+        if not decl:
+            self.warn("can't find OBJECT_DECLARE_INTERFACE_TYPE for interface type (%s)", uppercase)
+            return
+        yield self.append_field('instance_size', f'sizeof({decl.instancetype})')
+
 def type_infos(file: FileInfo) -> Iterable[TypeInfoVar]:
     return file.matches_of_type(TypeInfoVar)
 
diff --git a/scripts/codeconverter/codeconverter/regexps.py b/scripts/codeconverter/codeconverter/regexps.py
index 77993cc3b97..25af23fe9f9 100644
--- a/scripts/codeconverter/codeconverter/regexps.py
+++ b/scripts/codeconverter/codeconverter/regexps.py
@@ -101,6 +101,7 @@ def test_optional_pars():
 
 RE_FUN_CALL = S(RE_IDENTIFIER, r'\s*\(\s*', RE_SIMPLE_VALUE, r'\s*\)')
 RE_SIZEOF = S(r'sizeof\s*\(\s*', NAMED('sizeoftype', RE_TYPE), r'\s*\)')
+RE_ALIGNOF = S(r'__alignof__\s*\(\s*', NAMED('alignoftype', RE_TYPE), r'\s*\)')
 
 RE_ADDRESS = S(r'&\s*', RE_IDENTIFIER)
 
@@ -113,6 +114,6 @@ def test_optional_pars():
 
 # NOTE: this covers a very small subset of valid expressions
 
-RE_EXPRESSION = OR(RE_SIZEOF, RE_FUN_CALL, RE_MACRO_CONCAT, RE_SIMPLE_VALUE,
+RE_EXPRESSION = OR(RE_SIZEOF, RE_ALIGNOF, RE_FUN_CALL, RE_MACRO_CONCAT, RE_SIMPLE_VALUE,
                    RE_ARRAY, RE_ADDRESS)
 
-- 
2.31.1


